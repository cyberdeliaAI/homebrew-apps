cask "ibfetch" do
  arch arm: "arm64", intel: "x64"

  version "1.8.1"
  sha256 arm:   "8958b09005af7a8fcfc30f35f8146c7dc1801919a895f7d4b3aa81997398271d",
         intel: "cb82d09bd35ffd964573d2a208b5b22c33929adeee0b132e3ac6b5df116e47a9"

  url "https://github.com/cyberdeliaAI/ibfetch/releases/download/v#{version}/ibfetch-#{version}-macos-#{arch}.zip"
  name "ibfetch"
  desc "Selective music downloader for iBroadcast"
  homepage "https://github.com/cyberdeliaAI/ibfetch"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "ibfetch.app"
  binary "#{appdir}/ibfetch.app/Contents/MacOS/ibfetch", target: "ibfetch-cli"

  caveats <<~EOS
    Quit ibfetch before upgrading. Open ibfetch from Applications for the native window.
    Run ibfetch-cli gui for the local browser interface, or ibfetch-cli --help for commands.
    Music, settings and sign-in records remain after uninstalling.
    Update this Homebrew copy with brew upgrade --cask cyberdeliaAI/apps/ibfetch.

    The Mac downloads are Developer ID signed and notarized by Apple,
    with the notarization ticket attached.
  EOS
end
