cask "tagcast" do
  arch arm: "arm64", intel: "x64"

  version "0.75.0"
  sha256 arm:   "54f08f1007c32daa9c268ed097b80b48ac5de5817e8d5c93b53234d31b28f21b",
         intel: "d8311af367161ba6587d163ad25dd3a362c142144baf9bc6a4617c495ca2aa54"

  url "https://github.com/cyberdeliaAI/tagcast/releases/download/v#{version}/tagcast-#{version}-macos-#{arch}.zip"
  name "Tagcast"
  desc "Metadata editor and album player for iBroadcast"
  homepage "https://github.com/cyberdeliaAI/tagcast"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Tagcast.app"
  binary "#{appdir}/Tagcast.app/Contents/Resources/backend/tagcast-cli"

  caveats <<~EOS
    Quit Tagcast before upgrading; Electron reuses only a matching server version.
    Open Tagcast from Applications, or run tagcast-cli --open in a terminal.
    Settings and sign-in tokens are kept in ~/.tagcast and remain after uninstalling.

    Tagcast is not Developer ID signed or notarized. If macOS blocks the first launch,
    use System Settings > Privacy & Security > Open Anyway after reviewing the download.
  EOS
end
