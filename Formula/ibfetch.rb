class Ibfetch < Formula
  desc "Download selected music from your iBroadcast library"
  homepage "https://github.com/cyberdeliaAI/ibfetch"
  url "https://github.com/cyberdeliaAI/ibfetch/releases/download/v1.7.1/ibfetch-1.7.1-python.zip"
  sha256 "d2512ddfe4ce5ad9beb37502cbc596e459975cf472a51fafc798fa1ce9e6e9c7"
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
