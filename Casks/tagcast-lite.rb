cask "tagcast-lite" do
  arch arm: "arm64", intel: "x64"

  version "0.3.7"
  sha256 arm:   "cc2e9f6b598c55f702d2c67c74c2b23e45b07003962c8f87ebcf6aef8c991912",
         intel: "4caaca9257a7af513ccfd09ac5aac464d18b1861c2701e412d22759be5f23243"

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
