cask "telemetree" do
  version "0.1.2"
  sha256 "1bb0f51035a6b5faa84aed13f8c4e5f12c92c7d653f6f840a4a20e9b6b36a668"

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
