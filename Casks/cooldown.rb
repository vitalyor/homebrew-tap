cask "cooldown" do
  version "1.4.1"
  sha256 "b51383a7937f20a2905a28b6eebb5bc23e4049c16c80f7b1d00e0536e3b1dc35"

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
