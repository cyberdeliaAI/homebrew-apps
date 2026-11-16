cask "tagcast" do
  arch arm: "arm64", intel: "x64"

  version "1.9.5"
  sha256 arm:   "9b98fd29cd307e36dba845732e97e964ea728c73a032464f3ccd7996de8a9fce",
         intel: "14198ec38c95c4a1baa5f7f7581ab5f06233e27c7b3d26b762e82ed25584798c"

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

    Tagcast is Developer ID signed and notarized by Apple.
    Homebrew verifies the archive checksum and retains macOS Gatekeeper checks.
  EOS
end
