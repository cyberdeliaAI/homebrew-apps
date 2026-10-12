cask "tagcast" do
  arch arm: "arm64", intel: "x64"

  version "0.40.0"
  sha256 arm:   "60ba8b869db305cbe21eec41ad8472da6ab399340e674ca835b7f9ed05dd0267",
         intel: "0a7f5537fdf917eedbf2d730b00ee0b53a9cbb18e74d572efbf5e5a2cc4cab1c"

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
