cask "storageunleashed" do
  arch arm: "arm64", intel: ""

  version "1.1.0"
  sha256 arm:   "be55c0500fef12c91e05352cabea770b2378edfb158ef95569e2a5b58d1e2cff",
         intel: "5af495057ebd416e69813741d0d3291623c3588a928e84c59eefe86f97dec3ef"

  url "https://github.com/rajnishcoder/StorageUnleashed/releases/download/v#{version}/StorageUnleashed-#{version}#{arch.empty? ? "" : "-#{arch}"}.dmg"
  name "Storage Unleashed"
  desc "Fast, modern, visual desktop storage analyzer for macOS"
  homepage "https://www.storageunleashed.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "StorageUnleashed.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/StorageUnleashed.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.storageunleashed.app",
    "~/Library/Application Support/StorageUnleash",
    "~/Library/Application Support/StorageUnleashed",
    "~/Library/Caches/com.storageunleashed.app",
    "~/Library/Caches/StorageUnleash",
    "~/Library/Caches/StorageUnleashed",
    "~/Library/Preferences/com.storageunleashed.app.plist",
    "~/Library/Saved Application State/com.storageunleashed.app.savedState",
  ]
end
