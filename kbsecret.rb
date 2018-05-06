class Kbsecret < Formula
  desc "Secret manager backed by Keybase and KBFS"
  homepage "https://kbsecret.github.io"
  url "https://github.com/kbsecret/kbsecret/releases/download/1.7.1/kbsecret-1.7.1.tar.gz"
  sha256 "bd0798f6c4259a174fcd621f1917ef4ef8ac3e476a7de9c56801859cfdf0e9f2"

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
