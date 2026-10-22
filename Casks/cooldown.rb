cask "cooldown" do
  version "1.2.0"
  sha256 "cf7a1d4fb93fe907b44761b8c9476336088463829844ada894e87a8d30078a33"

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
