cask "nagare" do
  version "1.1.0"
  sha256 "89aa3f34b6a1e9fe2d11a78be8b7ef35379f0b5c6a217dd4040b32e43aa78eae"

  url "https://github.com/Nik-code/nagare/releases/download/v#{version}/Nagare-#{version}.dmg"
  name "Nagare"
  desc "Liquid Glass torrent client, a redesigned fork of Transmission"
  homepage "https://github.com/Nik-code/nagare"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Nagare.app"

  zap trash: [
    "~/Library/Application Support/Nagare",
    "~/Library/Caches/com.nemukai.nagare",
    "~/Library/Preferences/com.nemukai.nagare.plist",
  ]

  caveats <<~EOS
    Nagare is not notarised. If macOS blocks it the first time, open
    System Settings, then Privacy & Security, and choose Open Anyway.
  EOS
end
