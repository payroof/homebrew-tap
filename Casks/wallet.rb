cask "wallet" do
  version "0.1.1"
  sha256 "42da61e2dae8194b0d996024b4fd1562cea6b7c778185b0c949e2d7b3fe7c10a"

  url "https://github.com/payroof/wallet/releases/download/v#{version}/PayroofWallet-macos.zip"
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
