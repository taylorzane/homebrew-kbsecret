class Kbsecret < Formula
  desc "Secret manager backed by Keybase and KBFS"
  homepage "https://kbsecret.github.io"
  url "https://github.com/kbsecret/kbsecret/releases/download/1.3.1/kbsecret-1.3.1.tar.gz"
  sha256 "c2a698dbba61b4f8b2b11f5c8f59a0cf6f8b2fe22f9f35022a436029354570ce"

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
