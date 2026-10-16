cask "tagcast" do
  arch arm: "arm64", intel: "x64"

  version "0.50.0"
  sha256 arm:   "6ce677a113d360046047fa6c5c9b0042a368775dc88a90d6a2d5c531302c1d16",
         intel: "f04b07962be4337dcdb989fd947cf16981135b05c889ffc00a97eb94e74224c5"

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
