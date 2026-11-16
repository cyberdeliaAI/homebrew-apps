cask "scene-director" do
  arch arm: "arm64", intel: "x64"

  version "3.9.1"
  sha256 arm:   "b91838e7f48f8510de566abdce46c20d26dcd5a600338feccd7bdc229edeb81d",
         intel: "3b064f8244b29882c6b764fd3e187ec049f6012a6f1df31c4c53342efca07efd"

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
