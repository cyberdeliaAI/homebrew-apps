cask "ibfetch" do
  arch arm: "arm64", intel: "x64"

  version "1.8.3"
  sha256 arm:   "e9f70f2381256382e457f5eee945696de8ae643ba7838f59740c3b8c42180853",
         intel: "6e923fdaca6f5bc89d6e58ed4154b51be08657b68c7b73977cb49676e2b23896"

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
