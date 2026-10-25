cask "tagcast" do
  arch arm: "arm64", intel: "x64"

  version "0.85.1"
  sha256 arm:   "fd07288505e8d44c3b21510a5c4ce279a8cd6145e41abb1fc6e5298c2b66fbf6",
         intel: "a9d3c1327a840df3fe051f8feba978bbcd07c63dda8f816ded091432c9bc3c4a"

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

    Tagcast is not Developer ID signed or notarized. If macOS blocks the first launch,
    use System Settings > Privacy & Security > Open Anyway after reviewing the download.
  EOS
end
