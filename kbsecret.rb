class Kbsecret < Formula
  desc "Secret manager backed by Keybase and KBFS"
  homepage "https://kbsecret.github.io"
  url "https://github.com/kbsecret/kbsecret/releases/download/1.1.0/kbsecret-1.1.0.tar.gz"
  sha256 "f4d4547d0326d334c479a260f3324f61e6dffe5e1a019accc60da518fb5b7a9f"

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
