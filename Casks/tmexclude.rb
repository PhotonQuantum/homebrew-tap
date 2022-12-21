cask "tmexclude" do
  version "0.2.1"
  sha256 "0df3035727ee9b39931b1280a96e5d4120a5a10b1851645e08f3b0e5afb28b8e"

  url "https://github.com/PhotonQuantum/tmexclude/releases/download/v#{version}/TimeMachine.Exclude_#{version}_universal.dmg"
  name "TimeMachine Exclude"
  name "tmexclude"
  desc "Exclude undesired files (node_modules, target, etc) from your TimeMachine backup."
  homepage "https://github.com/PhotonQuantum/tmexclude"

  conflicts_with formula: "tmexclude"

  app "TimeMachine Exclude.app"

  zap trash: [
    "~/Library/Application Support/me.lightquantum.tmexclude",
    "~/Library/Caches/me.lightquantum.tmexclude",
    "~/Library/Saved Application State/me.lightquantum.tmexclude.savedState",
    "~/Library/WebKit/me.lightquantum.tmexclude",
  ]
end
