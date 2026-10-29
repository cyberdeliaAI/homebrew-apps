class Ibfetch < Formula
  desc "Download selected music from your iBroadcast library"
  homepage "https://github.com/cyberdeliaAI/ibfetch"
  url "https://github.com/cyberdeliaAI/ibfetch/releases/download/v1.3.0/ibfetch-1.3.0-python.zip"
  sha256 "cb51708d1d31e76f12770f51c98156a593fd2efee74f17024e7b46fb066efcf4"
  license "MIT"

  depends_on "python@3.14"

  def install
    bin.install "ibfetch.py" => "ibfetch"
    inreplace bin/"ibfetch", "#!/usr/bin/env python3", "#!#{formula_opt_bin("python@3.14")}/python3.14"
  end

  test do
    ENV["IBFETCH_HOME"] = testpath/"settings"
    assert_match "ibfetch #{version}", shell_output("#{bin}/ibfetch --version")
    assert_match "--work-folder", shell_output("#{bin}/ibfetch get --help")
  end
end
