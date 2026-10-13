# The Homebrew cask, as scripts/bump-tap.sh writes it to heed-build/homebrew-tap on every release, with the version
# and the zip's sha256 filled in. Change it here, not in the tap.
cask "heed" do
  version "0.1.0"
  sha256 "9285655d1c0c95d36e922f3867439fbf66a8267fa8ddcd8b4e057eebadddbd3f"

  url "https://github.com/heed-build/heed/releases/download/v#{version}/Heed-arm64.zip"
  name "Heed"
  desc "Command center for coding agents that works like a TUI, with vim keys"
  homepage "https://heed.build/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Heed.app"
  binary "#{appdir}/Heed.app/Contents/Helpers/heed"

  zap trash: [
    "~/.config/heed",
    "~/Library/Application Support/Heed",
    "~/Library/Caches/Heed",
    "~/Library/Preferences/net.nullean.heed.plist",
    "~/Library/Saved Application State/net.nullean.heed.savedState",
  ]
end
