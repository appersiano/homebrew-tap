cask "slide-spotlight" do
  version "1.2.0"
  sha256 "388e618223adc0110396d22f7f0548b02cee641896d5d0bb03c50ceb525ce2a1"

  url "https://8gl1iqkfgqoaimle.public.blob.vercel-storage.com/SlideSpotlight-macos-#{version}.dmg"
  name "Slide Spotlight"
  desc "Presentation remote receiver with spotlight, magnifier, and laser overlays"
  homepage "https://etnatech.it/slidespotlight"

  livecheck do
    url "https://8gl1iqkfgqoaimle.public.blob.vercel-storage.com/slidespotlight-latest.json"
    strategy :json do |json|
      json["tag_name"]&.delete_prefix("v")
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Slide Spotlight.app"

  zap trash: "~/Library/Preferences/com.slidespotlight.mac.plist"
end
