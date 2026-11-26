cask "tagcast-lite" do
  arch arm: "arm64", intel: "x64"

  version "0.4.0"
  sha256 arm:   "4f898c3dea96ab26db4be7fbd6d5c725fb7d649d2c79ca67a82218088e4b94d5",
         intel: "a0193d58479bd0fa93b078d37ca482d534e67bd8568d10f0e79a5d4c93514696"

  url "https://github.com/cyberdeliaAI/tagcast-lite/releases/download/v#{version}/tagcast-lite-#{version}-macos-#{arch}.zip"
  name "Tagcast Lite"
  desc "Lightweight, read-only iBroadcast player"
  homepage "https://github.com/cyberdeliaAI/tagcast-lite"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Tagcast Lite.app"
end
