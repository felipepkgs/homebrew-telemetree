cask "telemetree" do
  version "0.1.18"
  sha256 "794e921a107593922b8b52edb52cd2297bf147c85deb04ca97392c0262d66ffb"

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
