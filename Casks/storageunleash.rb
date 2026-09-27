cask "storageunleash" do
  arch arm: "arm64", intel: ""

  version "1.1.0"
  sha256 arm:   "a34bd3dc0adfdd1e9f76d6654d1b8566f0584864531fe0084ce8f7fdbd63ac4c",
         intel: "3afeddad06c78963643e4b557cad13dc93d80155081fc20a89b2709335b9d58c"

  url "https://github.com/rajnishcoder/StorageUnleash/releases/download/v#{version}/StorageUnleash-#{version}#{arch.empty? ? "" : "-#{arch}"}.dmg"
  name "Storage Unleashed"
  desc "Fast, modern, visual desktop storage analyzer for macOS"
  homepage "https://www.storageunleashed.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "StorageUnleash.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/StorageUnleash.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.storageunleashed.app",
    "~/Library/Application Support/StorageUnleash",
    "~/Library/Caches/com.storageunleashed.app",
    "~/Library/Caches/StorageUnleash",
    "~/Library/Preferences/com.storageunleashed.app.plist",
    "~/Library/Saved Application State/com.storageunleashed.app.savedState",
  ]
end
