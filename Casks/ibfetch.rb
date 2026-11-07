cask "ibfetch" do
  arch arm: "arm64", intel: "x64"

  version "1.6.0"
  sha256 arm:   "6c4c15e0225b677b62a76489596a5e6e5dba0a1ddd2b21c629af6765ade81b99",
         intel: "d18b777d8f1cec65a54b8e62d080a596e4fda5f1d1519aacc7843cedcfeb1f48"

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

    The Mac downloads are Developer ID signed and notarized by Apple,
    with the notarization ticket attached.
  EOS
end
