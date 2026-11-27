cask "slide-spotlight" do
  version "1.2.1"
  sha256 "e5c53a374f77c45fbc6c2e1c0586641cbaa5a8cd7ba563464af800eb55505ddd"

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
