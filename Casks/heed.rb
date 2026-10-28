# Written by heed's release workflow from packaging/homebrew/heed.rb in https://github.com/heed-build/heed;
# change it there, not here.
cask "heed" do
  version "0.22.0"
  sha256 "eb7ab7270e4d7a344c86af14c8665e760ee2627c13fe024bcf4e112dd3ef0042"

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
