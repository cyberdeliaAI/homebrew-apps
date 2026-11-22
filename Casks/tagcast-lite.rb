cask "tagcast-lite" do
  arch arm: "arm64", intel: "x64"

  version "0.3.8"
  sha256 arm:   "a3da068f9cf686d810192c11ba8969b1262a9fa1b44313d29f92d97053d7168d",
         intel: "3346b88f20e5e45839bc130dca073fa9c7187e3e65d6a7ec38d3b554f913820f"

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
