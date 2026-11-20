cask "ibfetch" do
  arch arm: "arm64", intel: "x64"

  version "1.7.1"
  sha256 arm:   "dd735a18a8ebd822846f5beb89b469d5abb5a3f61efc3387c5585ad78af0c6b7",
         intel: "741d7032053ad952becc2ddbc21a6aab6656d6aa9d8610b99b51f0749f6aa03b"

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
  binary "#{appdir}/ibfetch.app/Contents/Resources/backend/ibfetch-server", target: "ibfetch-cli"

  caveats <<~EOS
    Quit ibfetch before upgrading. Open ibfetch from Applications, or run ibfetch-cli.
    The bundled ibfetch-cli also provides the browser interface and terminal commands.
    Music, settings and sign-in records remain after uninstalling.
    Update this Homebrew copy with brew upgrade --cask cyberdeliaAI/apps/ibfetch.

    The Mac downloads are Developer ID signed and notarized by Apple,
    with the notarization ticket attached.
  EOS
end
