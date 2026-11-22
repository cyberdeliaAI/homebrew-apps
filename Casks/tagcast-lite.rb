cask "tagcast-lite" do
  arch arm: "arm64", intel: "x64"

  version "0.3.9"
  sha256 arm:   "48a93715a66e1a21fdcdb0cdaf57b5d60e64507aad0b8322c9aaae9bcafd3cf6",
         intel: "847dca8361b1353a8f026076ea7935d3fa8d156e43e38a655e4813ee18c2ede4"

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
