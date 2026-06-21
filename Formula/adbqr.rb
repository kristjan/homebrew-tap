# adbqr: https://github.com/kristjan/adbqr
# On each release, point url at the new tag and refresh sha256 with:
#   curl -sL <url> | shasum -a 256
class Adbqr < Formula
  desc "ADB pair using a QR code from the command line"
  homepage "https://github.com/kristjan/adbqr"
  url "https://github.com/kristjan/adbqr/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ec511fa2ba5b79e0b0b582d71be3bd2555008d8b16577c5f14a527a0de00a7ee"
  license "MIT"

  depends_on "qrencode"

  on_linux do
    depends_on "android-platform-tools" => :recommended
  end

  def install
    bin.install "bin/adbqr"
  end

  def caveats
    <<~EOS
      adbqr needs the Android `adb` tool on your PATH:
        macOS:  brew install --cask android-platform-tools
        Linux:  installed automatically if available, else use your distro's
                android-tools / platform-tools package.
    EOS
  end

  test do
    assert_match "Usage: adbqr", shell_output("#{bin}/adbqr --help")
  end
end
