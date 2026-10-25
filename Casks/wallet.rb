cask "wallet" do
  version "0.1.0"
  sha256 "23c21c9f8ef20d43685f92a0761a2ae19ecae291d82c8eb2ec11209835a38d4f"

  url "https://github.com/payroof/wallet/releases/download/v#{version}/PayroofWallet-macos-arm64.zip"
  name "Payroof Wallet"
  desc "Self-custody crypto wallet for Payroof payments"
  homepage "https://github.com/payroof/wallet"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "PayroofWallet.app"

  # Ad-hoc signed, not notarized: clear the download quarantine so macOS opens it.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/PayroofWallet.app"]
  end
end
