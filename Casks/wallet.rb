cask "wallet" do
  version "0.3.0"
  sha256 "ec66211c0fef243141785902cf194d933b16bb711492efb9aa5581113027e42b"

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
