class Ibfetch < Formula
  desc "Download selected music from your iBroadcast library"
  homepage "https://github.com/cyberdeliaAI/ibfetch"
  url "https://github.com/cyberdeliaAI/ibfetch/archive/refs/tags/v1.8.2.tar.gz"
  sha256 "db20eb3c1f3fefc16a8dcb3bea6560834b8966cd6bf41272b5ef2b8e7f84651d"
  license "MIT"

  depends_on "rust" => :build

  on_linux do
    depends_on "pkgconf" => :build
    depends_on "openssl@3"
  end

  def fetch
    system "cargo", "fetch", *std_cargo_fetch_args
  end

  def install
    system "cargo", "install", *std_cargo_args, "--no-default-features"
  end

  test do
    ENV["IBFETCH_HOME"] = testpath/"settings"
    assert_match "ibfetch #{version}", shell_output("#{bin}/ibfetch --version")
    assert_match "--work-folder", shell_output("#{bin}/ibfetch get --help")
  end
end
