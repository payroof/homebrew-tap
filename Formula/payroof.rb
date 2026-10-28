class Payroof < Formula
  desc "Watch-only crypto payment references, scanning and signed webhooks"
  homepage "https://github.com/payroof/payroof"
  version "0.3.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/payroof/payroof/releases/download/v0.3.1/payroof-aarch64-apple-darwin.tar.gz"
      sha256 "07383ed1046b8184d2d1075bc46011d69f8b9782309700072908a68f3866ee9d"
    end
    on_intel do
      url "https://github.com/payroof/payroof/releases/download/v0.3.1/payroof-x86_64-apple-darwin.tar.gz"
      sha256 "614222d2c5fd6bd4ec961f51b063728e0b1cc4ad444651500544abfbc1079ff7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/payroof/payroof/releases/download/v0.3.1/payroof-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "53e36124b03c07caba995d33f7d90047bc3484ee0dcb76049526b7e8e4d88b17"
    end
    on_intel do
      url "https://github.com/payroof/payroof/releases/download/v0.3.1/payroof-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "38d36a64c4ac681a21d1a9c3d8352163d3776888cebd350fd48133b3dd2ab770"
    end
  end

  def install
    bin.install "payroof"
  end

  test do
    shell_output("#{bin}/payroof healthcheck http://127.0.0.1:9/readyz 2>&1", 1)
  end
end
