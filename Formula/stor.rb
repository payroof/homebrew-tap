class Stor < Formula
  desc "Storefronts with exact crypto checkout and confirmed delivery"
  homepage "https://github.com/payroof/stor"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/payroof/stor/releases/download/v0.1.0/stortop-aarch64-apple-darwin.tar.gz"
      sha256 "71abdde2d98aa20fd7ed004cbb6198b46e21fa3bd81c519ea53be43ea584146c"
    end
    on_intel do
      url "https://github.com/payroof/stor/releases/download/v0.1.0/stortop-x86_64-apple-darwin.tar.gz"
      sha256 "63cb5b75542fca0bdeb7bc33a1d6f6736dd2485da2d7dd6e4643c176af202c57"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/payroof/stor/releases/download/v0.1.0/stortop-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "952dee208d1df716cf7189f52b439679c67765a6e2f423a6e3b97adc652e8575"
    end
    on_intel do
      url "https://github.com/payroof/stor/releases/download/v0.1.0/stortop-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b6cff1b57bae8dc612f591b702a7c6943a4a531fa61bd8d3ecf1ceafdfd61c19"
    end
  end

  def install
    bin.install "stortop"
  end

  test do
    shell_output("#{bin}/stortop healthcheck http://127.0.0.1:9/readyz 2>&1", 1)
  end
end
