cask "tagcast" do
  arch arm: "arm64", intel: "x64"

  version "1.6.0"
  sha256 arm:   "ba6bd097187b638ed235f1495aa9270636e93adf93b9ebea8749eb95375326c9",
         intel: "973d2a431ea2b6c651b68294142d1a684ee939873fddbd8136c1c4a16b753ee0"

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
