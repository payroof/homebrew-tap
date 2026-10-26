class Payroof < Formula
  desc "Watch-only crypto payment references, scanning and signed webhooks"
  homepage "https://github.com/payroof/payroof"
  version "0.3.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/payroof/payroof/releases/download/v0.3.0/payroof-aarch64-apple-darwin.tar.gz"
      sha256 "78c23eec492bfe3a5e065ffbb99066d54920b6afb142f00dc9f965964ac60a05"
    end
    on_intel do
      url "https://github.com/payroof/payroof/releases/download/v0.3.0/payroof-x86_64-apple-darwin.tar.gz"
      sha256 "43363d2fbd6471f67de864b97baa53e142f38696960b9f3e982e7c3127e1c2ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/payroof/payroof/releases/download/v0.3.0/payroof-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c72c259ec23895d256ecdab34852cb443991096be9788b206090ff17ef58bf8e"
    end
    on_intel do
      url "https://github.com/payroof/payroof/releases/download/v0.3.0/payroof-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "27c7f5f4ae7abfcbd42587f96859792e080c3c2df04c210a77b5c2c00a67c0b7"
    end
  end

  def install
    bin.install "payroof"
  end

  test do
    shell_output("#{bin}/payroof healthcheck http://127.0.0.1:9/readyz 2>&1", 1)
  end
end
