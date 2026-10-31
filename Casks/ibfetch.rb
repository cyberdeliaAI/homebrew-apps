cask "ibfetch" do
  arch arm: "arm64", intel: "x64"

  version "1.5.0"
  sha256 arm:   "f44793cc3a9dc744388ccbd0f34eac08aaed92d97a65221210d88edc7e07f46f",
         intel: "391e52888163153bf585720f4164445103a404316d2f73d3a7ed393b17958bea"

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
