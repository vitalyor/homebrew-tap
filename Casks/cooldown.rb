cask "cooldown" do
  version "1.4.5"
  sha256 "50629b5ea99fbd608fa6f9dfb472bc5934b23807d5894250e59cb3c5c27b936f"

  url "https://github.com/vitalyor/cooldown/releases/download/v#{version}/Cooldown-#{version}.dmg"
  name "Cooldown"
  desc "Menu bar app for Codex and Claude limits, agent activity and auto-continue"
  homepage "https://github.com/vitalyor/cooldown"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :tahoe"

  app "Cooldown.app"

  uninstall quit: "com.vitalyor.cooldown"

  zap trash: [
    "~/Library/Application Support/Cooldown",
    "~/Library/Preferences/com.vitalyor.cooldown.plist",
  ]
end
