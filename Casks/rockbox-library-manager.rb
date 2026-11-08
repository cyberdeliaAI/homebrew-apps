# Updated by Rockbox Library Manager's verified Homebrew release workflow.
cask "rockbox-library-manager" do
  arch arm: "arm64", intel: "x64"

  version "1.4.0"
  sha256 arm:   "7804a657ab7389f7ba3809c36f61d1f7897ed359525a7c075f3715a0c3489576",
         intel: "bfbb171892578b062232163114fbea159cc17fb01817ff0a51f6b4e6187bebab"

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
