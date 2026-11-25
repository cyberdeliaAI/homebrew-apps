cask "tagcast-lite" do
  arch arm: "arm64", intel: "x64"

  version "0.3.10"
  sha256 arm:   "8e73a40c8b1e012041ab0a83b85fa9b0fa5081cc57422b44f66692f449b74fab",
         intel: "49efcde1a219acdee4ba4c37ae728ebfddf88d7b9e4f79755e6e46710c407b95"

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
