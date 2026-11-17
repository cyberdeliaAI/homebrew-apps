cask "scene-director" do
  arch arm: "arm64", intel: "x64"

  version "3.10.0"
  sha256 arm:   "2b865581cfb62cdde90c0a0379624a153e7d95971bb0a71ad4e444187eaeec75",
         intel: "457cddcaf0272d9f8d0f181ccf40af22364ba6948c11783e9976c03fd8d5fcf3"

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
