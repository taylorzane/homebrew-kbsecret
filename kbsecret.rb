class Kbsecret < Formula
  desc "Secret manager backed by Keybase and KBFS"
  homepage "https://kbsecret.github.io"
  url "https://github.com/kbsecret/kbsecret/releases/download/1.6.0/kbsecret-1.6.0.tar.gz"
  sha256 "7ad6f68d8e1613dca91ddbe1f27ca24dd7bc0d160d2df9d5f3a1d64c21a45896"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "kbsecret.gemspec"
    system "gem", "install", "kbsecret-#{version}.gem"
    bin.install libexec/"bin/kbsecret"
    bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
    man1.install Dir["man/man1/*.1"]
    man5.install Dir["man/man5/*.5"]
  end

  # XXX: Add test block.
end
