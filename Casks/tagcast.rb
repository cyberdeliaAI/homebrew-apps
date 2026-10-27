cask "tagcast" do
  arch arm: "arm64", intel: "x64"

  version "1.0.0"
  sha256 arm:   "579679f8e5dc6fe83fc2a5d2ba9f64afbd307414ca39a18e9d4f312651ba5eaf",
         intel: "07d6d01f2835f070eb3c35c1092f182ac63743109064e039992cc28eb7cefc7c"

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
