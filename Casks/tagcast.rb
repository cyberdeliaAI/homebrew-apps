cask "tagcast" do
  arch arm: "arm64", intel: "x64"

  version "0.41.1"
  sha256 arm:   "d5976ce42e72032b6e60837373539a3beaab88d308e4bc4fad348730ba5553b9",
         intel: "c7241d33adb7a05f1c2deb07f90d5c7044ec6954fea4edab3db385b30d4d5dd8"

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
