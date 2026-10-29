# Written by heed's release workflow from packaging/homebrew/heed.rb in https://github.com/heed-build/heed;
# change it there, not here.
cask "heed" do
  version "0.30.0"
  sha256 "dbb12b03926ebf23fc1bd935ead8b5157256569f1f4913275bd8ed0e8a2ba978"

  url "https://github.com/heed-build/heed/releases/download/v#{version}/Heed-arm64.zip"
  name "Heed"
  desc "Command center for coding agents that works like a TUI, with vim keys"
  homepage "https://heed.build/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Heed updates itself (Sparkle); brew upgrade leaves it to that (brew upgrade --greedy still upgrades it).
  auto_updates true

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Heed.app"
  binary "#{appdir}/Heed.app/Contents/Helpers/heed"

  zap trash: [
    "~/.config/heed",
    "~/Library/Application Support/Heed",
    "~/Library/Caches/Heed",
    "~/Library/Preferences/build.heed.app.plist",
    "~/Library/Preferences/net.nullean.heed.plist",
    "~/Library/Saved Application State/build.heed.app.savedState",
    "~/Library/Saved Application State/net.nullean.heed.savedState",
  ]
end
