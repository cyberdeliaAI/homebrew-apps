class Ibfetch < Formula
  desc "Download selected music from your iBroadcast library"
  homepage "https://github.com/cyberdeliaAI/ibfetch"
  url "https://github.com/cyberdeliaAI/ibfetch/releases/download/v1.7.0/ibfetch-1.7.0-python.zip"
  sha256 "21f55681385f4d725cc061a97828876885f71d18f53182f9c7c02b42faa9e7a8"
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
