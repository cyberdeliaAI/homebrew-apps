cask "tagcast" do
  arch arm: "arm64", intel: "x64"

  version "1.5.0"
  sha256 arm:   "0a28e65b3320d8a6bbac147f5215afc1b0d872918770df3d456672b87bb7ac74",
         intel: "eda4d44f56a961195d25cb9ea18a7ce6d420f98f9f85a9cb30da91496c253a90"

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
