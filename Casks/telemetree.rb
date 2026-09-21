cask "telemetree" do
  version "0.1.8"
  sha256 "ef6dcc09650655aec6b37a004e0832c4309d8a8e509b05779ce00fa31455123b"

  url "https://github.com/felipepkgs/telemetree/releases/download/v#{version}/Telemetree.app.zip"
  name "Telemetree"
  desc "Native macOS MySQL client built around persistent query documents and a snippet library"
  homepage "https://github.com/felipepkgs/telemetree"

  depends_on macos: :sonoma

  app "Telemetree.app"

  # Ad-hoc signed only (no Apple Developer ID) — see felipepkgs/telemetree's
  # Scripts/build_app.sh for why. Clears the Gatekeeper quarantine flag so
  # users don't have to right-click > Open manually on first launch.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Telemetree.app"]
  end

  zap trash: [
    "~/Library/Application Support/Telemetree",
    "~/Library/Preferences/com.felipepkgs.telemetree.plist",
  ]
end
