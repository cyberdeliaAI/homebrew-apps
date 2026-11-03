cask "tagcast" do
  arch arm: "arm64", intel: "x64"

  version "1.4.0"
  sha256 arm:   "f84a6b18e19d183d68f87d7002fd30f79b22ee281bcb66e7d4ad8fd95322aee5",
         intel: "c9576361c5b38d85cd5d4f6dee9b7ed47983d1de6f8148807fab3afd072b343e"

  url "https://github.com/cyberdeliaAI/tagcast/releases/download/v#{version}/tagcast-#{version}-macos-#{arch}.zip"
  name "Tagcast"
  desc "Metadata editor and album player for iBroadcast"
  homepage "https://github.com/cyberdeliaAI/tagcast"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Tagcast.app"
  binary "#{appdir}/Tagcast.app/Contents/Resources/backend/tagcast-cli"

  caveats <<~EOS
    Quit Tagcast before upgrading; Electron reuses only a matching server version.
    Open Tagcast from Applications, or run tagcast-cli --open in a terminal.
    Settings and sign-in tokens are kept in ~/.tagcast and remain after uninstalling.

    Tagcast is Developer ID signed and notarized by Apple.
    Homebrew verifies the archive checksum and retains macOS Gatekeeper checks.
  EOS
end
