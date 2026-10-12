cask "tagcast" do
  arch arm: "arm64", intel: "x64"

  version "0.30.0"
  sha256 arm:   "f2f9b5f2d9b75c1b16bbbc6362bd09adceac2923c5f91403134ea7b16199917e",
         intel: "3a8d3a5f7419c534556908b3af4381ba6023e278280359a0f4084079faa93852"

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
