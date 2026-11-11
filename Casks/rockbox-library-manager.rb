# Updated by Rockbox Library Manager's verified Homebrew release workflow.
cask "rockbox-library-manager" do
  arch arm: "arm64", intel: "x64"

  version "1.5.0"
  sha256 arm:   "ecbca2bf84f14c2dd3cce8c7afc11c6d2eb29948adbd6315da4abbcea7791e50",
         intel: "2b114e1654670221fc72f7a013a5343d3ad65f11ea4ad7ddfd3d8a7784720a54"

  url "https://github.com/cyberdeliaAI/rockbox-library-manager/releases/download/v#{version}/rockbox-library-manager-v#{version}-macos-#{arch}.zip"
  name "Rockbox Library Manager"
  desc "Music library, artwork and tag manager for Rockbox and PodBox"
  homepage "https://github.com/cyberdeliaAI/rockbox-library-manager"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Rockbox Library Manager.app"
  binary "#{appdir}/Rockbox Library Manager.app/Contents/MacOS/rockbox-library-manager"

  caveats <<~EOS
    Quit Rockbox Library Manager before upgrading.
    Open the app from Applications, or run rockbox-library-manager in a terminal.
    Settings, credentials and the library index remain after uninstalling.
    FFmpeg is optional and separate; select its executable in Settings for audio conversion.

    macOS still performs its normal first-launch security checks.
    See the release's signing details before approving a blocked download.
  EOS
end
