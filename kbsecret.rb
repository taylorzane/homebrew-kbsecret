class Kbsecret < Formula
  desc "A secret manager backed by Keybase and KBFS"
  homepage "https://kbsecret.github.io"
  url "https://github.com/kbsecret/kbsecret/archive/0.9.4.tar.gz"
  sha256 "56a780b012d84ef2130add0e9e3de8621ccfff73131e53f8df1d453867d40374"

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "kbsecret.gemspec"
    system "gem", "install", "kbsecret-#{version}.gem"
    bin.install libexec/"bin/kbsecret"
    bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
    # XXX: Manpages.
  end

  # XXX: Add test block.
end
