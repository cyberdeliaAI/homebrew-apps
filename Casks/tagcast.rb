cask "tagcast" do
  arch arm: "arm64", intel: "x64"

  version "0.42.0"
  sha256 arm:   "2cc8f1913cd4e4ae3c3faf53983ed26cfd0a8bd5e49a1ac7fd0b2b70c64974a0",
         intel: "68e42b6c86e1c9207ddf394d7470ea70b4aea72ca31e7ec74d13f19f555a3683"

  url "https://github.com/cyberdeliaAI/tagcast/releases/download/v#{version}/tagcast-#{version}-macos-#{arch}.zip"
  name "Tagcast"
  desc "Metadata editor and album player for iBroadcast"
  homepage "https://github.com/cyberdeliaAI/tagcast"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Tagcast.app"
  binary "#{appdir}/Tagcast.app/Contents/MacOS/tagcast-cli"

  caveats <<~EOS
    Stop any running Tagcast before upgrading; a second copy reuses the existing server.
    Open Tagcast from Applications, or run tagcast-cli --open in a terminal.
    Settings and sign-in tokens are kept in ~/.tagcast and remain after uninstalling.

    Tagcast is not Developer ID signed or notarized. If macOS blocks the first launch,
    use System Settings > Privacy & Security > Open Anyway after reviewing the download.
  EOS
end
