class Payroof < Formula
  desc "Watch-only crypto payment references, scanning and signed webhooks"
  homepage "https://github.com/payroof/payroof"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/payroof/payroof/releases/download/v0.1.0/payroof-aarch64-apple-darwin.tar.gz"
      sha256 "1a79238bc8b93a99d6666e146aa1fd60504a0dbaa2d9bccaa138e4ab5ed6cbb9"
    end
    on_intel do
      url "https://github.com/payroof/payroof/releases/download/v0.1.0/payroof-x86_64-apple-darwin.tar.gz"
      sha256 "952ad91f1c3c30e6bd41964044f2bc7841bcfb328cda430b2bed58f796ed56cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/payroof/payroof/releases/download/v0.1.0/payroof-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2cfa9887f050562ec98b524ad83bcabc8f70e2bf7cd28a19a944cabec73d3f6e"
    end
    on_intel do
      url "https://github.com/payroof/payroof/releases/download/v0.1.0/payroof-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7ae3bec778632dfe6593cd3cfb1a0d6cf7f9b09dce1aaf7cd1d904f870c7948d"
    end
  end

  def install
    bin.install "payroof"
  end

  test do
    shell_output("#{bin}/payroof healthcheck http://127.0.0.1:9/readyz 2>&1", 1)
  end
end
