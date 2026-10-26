cask "wallet" do
  version "0.2.0"
  sha256 "d8b79297d0af66fb1ac3488f54b46158298ce11597da5281e1a39f5711e56a9d"

  url "https://github.com/payroof/wallet/releases/download/v#{version}/Payroof.dmg"
  name "Payroof Wallet"
  desc "Self-custody crypto wallet for Payroof payments"
  homepage "https://github.com/payroof/wallet"

  depends_on macos: :sequoia

  app "Payroof.app"

  caveats <<~EOS
    Payroof Wallet is not notarized yet. On first launch, allow it in
    System Settings → Privacy & Security → Open Anyway.
  EOS
end
