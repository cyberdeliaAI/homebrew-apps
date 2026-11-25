cask "ibfetch" do
  arch arm: "arm64", intel: "x64"

  version "1.8.2"
  sha256 arm:   "b53998e8942d4c31bacc284f8f3847e2ac8567036ed248fc7182218446b79452",
         intel: "02eecedbb77f8a761200a55d9675549a4faed2d67d5b6672eff4003c5d20283f"

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
