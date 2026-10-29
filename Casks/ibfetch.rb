cask "ibfetch" do
  arch arm: "arm64", intel: "x64"

  version "1.3.1"
  sha256 arm:   "ad22b0c8e4e51b223cea64192ed42a3c63685b3a544fa34a4f6e96de2bd1e36f",
         intel: "07e40c1e0d059faf6ba3ea4f2ef19415f8e73258ff6b63b0886c57e8c01c0afd"

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
