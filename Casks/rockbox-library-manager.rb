# Updated by Rockbox Library Manager's verified Homebrew release workflow.
cask "rockbox-library-manager" do
  arch arm: "arm64", intel: "x64"

  version "1.3.0"
  sha256 arm:   "55eebc2f047c7f85ca23d28474178e2c475d8c5ebd8f55111b5fdcdf338d39ed",
         intel: "b37724fff372579d11f45cb8750787dbde3c7339d94ea8535bc3356d0645e3bf"

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

    Rockbox Library Manager is not Developer ID signed or notarized. If macOS blocks
    the first launch, use System Settings > Privacy & Security > Open Anyway after
    reviewing the download.
  EOS
end
