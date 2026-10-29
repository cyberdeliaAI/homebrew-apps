cask "tagcast" do
  arch arm: "arm64", intel: "x64"

  version "1.1.0"
  sha256 arm:   "e5368a78243ad41ba76cfc94c900fdc0b29fcbf22ba43d4b99f347f8ed990eb7",
         intel: "333e7263b865973aeeb2a55cf7ee1fa0bd5218f236e60365867baeefa3556725"

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
