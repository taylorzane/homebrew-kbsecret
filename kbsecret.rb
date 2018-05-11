class Kbsecret < Formula
  desc "Secret manager backed by Keybase and KBFS"
  homepage "https://kbsecret.github.io"
  url "https://github.com/kbsecret/kbsecret/releases/download/1.7.2/kbsecret-1.7.2.tar.gz"
  sha256 "0101417094e4e0cba81ab5341e7ee7c0707fd6474feb4944cf3a7f7a7a9616a1"

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
