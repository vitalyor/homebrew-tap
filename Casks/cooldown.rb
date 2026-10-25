cask "cooldown" do
  version "1.3.1"
  sha256 "4eb94daa31c04c9d589bf695715952b2ea731d89eb303239c69b92eec6349d69"

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
