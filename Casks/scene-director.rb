cask "scene-director" do
  arch arm: "arm64", intel: "x64"

  version "3.9.0"
  sha256 arm:   "39874cec1790716fbaffd8a34fdf6d6a28deb668ce5f97a9e5c217272628bb7e",
         intel: "e240a3b730252ed53e57bab2c8a390685a7d853bd4ee4b0f171905044ccf40b1"

  url "https://github.com/cyberdeliaAI/Scene-Director/releases/download/v#{version}/scene-director-#{version}-macos-#{arch}.zip"
  name "Scene Director"
  desc "Prompt writing and LoRA dataset preparation with local language models"
  homepage "https://github.com/cyberdeliaAI/Scene-Director"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Scene Director.app"

  caveats <<~EOS
    Quit Scene Director before upgrading. Open it from Applications.
    A compatible model server such as LM Studio is required; Vision needs a vision-capable model.
    Settings, saved prompts and dataset sessions are stored separately and survive uninstalling.

    Scene Director is Developer ID signed and notarized by Apple.
    Homebrew verifies the archive checksum and retains macOS Gatekeeper checks.
  EOS
end
