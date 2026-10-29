class Ibfetch < Formula
  desc "Download selected music from your iBroadcast library"
  homepage "https://github.com/cyberdeliaAI/ibfetch"
  url "https://github.com/cyberdeliaAI/ibfetch/releases/download/v1.3.1/ibfetch-1.3.1-python.zip"
  sha256 "bac6fb013ec6e9d0566e628e83d792f9adf987d38df930d74fd588bc8a863517"
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
