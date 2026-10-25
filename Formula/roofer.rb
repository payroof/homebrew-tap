class Roofer < Formula
  desc "Run the local Payroof stack and its end-to-end tests"
  homepage "https://github.com/payroof/roofer"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/payroof/roofer/releases/download/v0.1.0/roofer-aarch64-apple-darwin.tar.gz"
      sha256 "34e8adfef0b7e13090bb59cb5f5686fb052c42743c028e548ac2a8e43541deef"
    end
    on_intel do
      url "https://github.com/payroof/roofer/releases/download/v0.1.0/roofer-x86_64-apple-darwin.tar.gz"
      sha256 "5af5dca45f1cb0b4e8a076997ec6459521e67183861bdc92e5e28c1aa756c892"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/payroof/roofer/releases/download/v0.1.0/roofer-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bc7c44e6657675cc9101f07a4185ebe6885785b35b036d4d4b29d25eb61dafdf"
    end
    on_intel do
      url "https://github.com/payroof/roofer/releases/download/v0.1.0/roofer-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a8b7a7e68afbb8295fcb636a86dd08225613dcc3bf44cbcfbfbc27168b32c2da"
    end
  end

  def install
    bin.install "roofer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/roofer --version")
  end
end
