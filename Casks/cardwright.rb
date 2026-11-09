cask "cardwright" do
  arch arm: "arm64", intel: "x64"

  version "1.3.0"
  sha256 arm:   "1030e78cbcdccf95c65a1fdd9031ffd40c438b3ac9464b93342cf28c0f6bab72",
         intel: "1d276863c4a357854654754563decf98b15db435aee804ba5e0221e6a0c5bc44"

  url "https://github.com/cyberdeliaAI/Cardwright/releases/download/v#{version}/cardwright-#{version}-mac-#{arch}.zip"
  name "Cardwright"
  desc "Character card editor with AI drafting and lorebook tools"
  homepage "https://github.com/cyberdeliaAI/Cardwright"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Cardwright.app"

  caveats <<~EOS
    Quit Cardwright before upgrading; the desktop app reuses only a matching server version.
    Desktop autosave and presets are separate from your browser profile.
    Cards and persona libraries can be transferred with JSON/PNG and preset backup/import.
    The desktop profile in ~/Library/Application Support/Cardwright remains after uninstalling.

    Cardwright is Developer ID signed and notarized by Apple.
    Homebrew verifies archive checksums and retains macOS Gatekeeper checks.
  EOS
end
