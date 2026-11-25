cask "slide-spotlight" do
  version "1.0.11"
  sha256 "741f43dce1725d64e2fc0df03a14d063d25aae7a399a9c6239a0fc2e17b7e4da"

  url "https://8gl1iqkfgqoaimle.public.blob.vercel-storage.com/SlideSpotlight-macos-#{version}.dmg",
      verified: "8gl1iqkfgqoaimle.public.blob.vercel-storage.com/"
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
  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "Slide Spotlight.app"

  zap trash: [
    "~/Library/Preferences/com.slidespotlight.mac.plist",
  ]
end
