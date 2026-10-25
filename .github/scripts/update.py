"""Render Formula/ and Casks/ from the latest GitHub release of each Payroof project."""

import json
import os
import urllib.error
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
TARGETS = {
    ("macos", "arm"): "aarch64-apple-darwin",
    ("macos", "intel"): "x86_64-apple-darwin",
    ("linux", "arm"): "aarch64-unknown-linux-gnu",
    ("linux", "intel"): "x86_64-unknown-linux-gnu",
}
FORMULAE = {
    "payroof": {
        "bin": "payroof",
        "desc": "Watch-only crypto payment references, scanning and signed webhooks",
        "test": 'shell_output("#{bin}/payroof healthcheck http://127.0.0.1:9/readyz 2>&1", 1)',
    },
    "stor": {
        "bin": "stortop",
        "desc": "Storefronts with exact crypto checkout and confirmed delivery",
        "test": 'shell_output("#{bin}/stortop healthcheck http://127.0.0.1:9/readyz 2>&1", 1)',
    },
    "roofer": {
        "bin": "roofer",
        "desc": "Run the local Payroof stack and its end-to-end tests",
        "test": 'assert_match version.to_s, shell_output("#{bin}/roofer --version")',
    },
}
CASK_ASSET = "PayroofWallet-macos.zip"


def latest(repo):
    request = urllib.request.Request(
        f"https://api.github.com/repos/payroof/{repo}/releases/latest",
        headers={
            "Accept": "application/vnd.github+json",
            "Authorization": f"Bearer {os.environ['GITHUB_TOKEN']}",
        },
    )
    try:
        with urllib.request.urlopen(request) as response:
            release = json.load(response)
    except urllib.error.HTTPError as error:
        if error.code == 404:
            return None
        raise
    digests = {}
    for asset in release["assets"]:
        algorithm, _, digest = (asset.get("digest") or "").partition(":")
        if algorithm == "sha256":
            digests[asset["name"]] = (asset["browser_download_url"], digest)
    return release["tag_name"].removeprefix("v"), digests


def formula(name, spec, version, digests):
    blocks = []
    for os_name in ("macos", "linux"):
        arches = []
        for arch in ("arm", "intel"):
            url, sha256 = digests[f"{spec['bin']}-{TARGETS[os_name, arch]}.tar.gz"]
            arches.append(
                f"    on_{arch} do\n"
                f'      url "{url}"\n'
                f'      sha256 "{sha256}"\n'
                f"    end"
            )
        blocks.append(f"  on_{os_name} do\n" + "\n".join(arches) + "\n  end")
    return (
        f"class {name.capitalize()} < Formula\n"
        f'  desc "{spec["desc"]}"\n'
        f'  homepage "https://github.com/payroof/{name}"\n'
        f'  version "{version}"\n'
        '  license any_of: ["MIT", "Apache-2.0"]\n\n'
        + "\n\n".join(blocks)
        + "\n\n"
        f"  def install\n"
        f'    bin.install "{spec["bin"]}"\n'
        f"  end\n\n"
        f"  test do\n"
        f"    {spec['test']}\n"
        f"  end\n"
        f"end\n"
    )


def cask(version, digests):
    url, sha256 = digests[CASK_ASSET]
    url = url.replace(f"v{version}", "v#{version}")
    return f'''cask "wallet" do
  version "{version}"
  sha256 "{sha256}"

  url "{url}"
  name "Payroof Wallet"
  desc "Self-custody crypto wallet for Payroof payments"
  homepage "https://github.com/payroof/wallet"

  depends_on macos: :sequoia

  app "PayroofWallet.app"

  caveats <<~EOS
    Payroof Wallet is not notarized yet. On first launch, allow it in
    System Settings → Privacy & Security → Open Anyway.
  EOS
end
'''


def write(path, text):
    path.parent.mkdir(exist_ok=True)
    if not path.exists() or path.read_text() != text:
        path.write_text(text)
        print(f"updated {path.relative_to(ROOT)}")


def main():
    for name, spec in FORMULAE.items():
        release = latest(name)
        if release:
            write(ROOT / "Formula" / f"{name}.rb", formula(name, spec, *release))
    release = latest("wallet")
    if release and CASK_ASSET in release[1]:
        write(ROOT / "Casks" / "wallet.rb", cask(*release))


if __name__ == "__main__":
    main()
