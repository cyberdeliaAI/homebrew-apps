cask "ibfetch" do
  arch arm: "arm64", intel: "x64"

  version "1.4.0"
  sha256 arm:   "4889f96e02eab897c526a78403ef07ba7281c07149ab7d564e1ecd55491a6029",
         intel: "ed3ebd2726d149f363038a660867254db2c11e3a1cf6695fa845fb0e9d3ecc2d"

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
