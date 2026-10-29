cask "ibfetch" do
  arch arm: "arm64", intel: "x64"

  version "1.3.0"
  sha256 arm:   "57795b9fca016fd2a844de4775d14f904304499b8af9f7e3b2950845061bf193",
         intel: "b7994d1030dc14fc6addcfe910189d036b123b7d72f4d4980ef37eb45bce8882"

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

    The app is ad-hoc signed, without Developer ID signing or notarization.
    If macOS blocks the first launch, review the download and use
    System Settings > Privacy & Security > Open Anyway for this app.
  EOS
end
