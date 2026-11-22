cask "ibfetch" do
  arch arm: "arm64", intel: "x64"

  version "1.8.0"
  sha256 arm:   "6b3850f1859619b6afec1e7684a65d0d590869e9a93a2d93a7bb654be63f9bab",
         intel: "8d683808546482ac188c36111aec2d4459dd7bce935e643a037bc9735e699034"

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
