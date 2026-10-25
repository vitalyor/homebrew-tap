cask "cooldown" do
  version "1.3.0"
  sha256 "807b497c9db774801820ee530347ee554804d3a85b5c56927fce3f6e6c56d193"

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

  # Cooldown is open source but not notarized by Apple (that needs a paid developer account).
  # Without this, macOS would refuse to open it on first launch.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Cooldown.app"]
  end

  uninstall quit: "com.vitalyor.cooldown"

  zap trash: [
    "~/Library/Application Support/Cooldown",
    "~/Library/Preferences/com.vitalyor.cooldown.plist",
  ]
end
