cask "tagcast" do
  arch arm: "arm64", intel: "x64"

  version "1.2.0"
  sha256 arm:   "3dfe810a7a4bc05506b0cbfb56686697494f38da361dc695bd0c3da9de744e0b",
         intel: "3aea787a2c3e712bc9b9d4ab632e24542aff75ff43e07c3771243f316aa1dea7"

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
