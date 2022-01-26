class Tmexclude < Formula
  desc "Exclude undesired files (node_modules, target, etc) from your TimeMachine backup"
  homepage "https://github.com/PhotonQuantum/tmexclude"
  url "https://github.com/PhotonQuantum/tmexclude/releases/download/v0.1.0-beta.2/tmexclude-0.1.0-beta.2.tar.gz"
  sha256 "39126ee38310cd07c2fab08453b4e03f379e43506a9dd362cd42883547b4c9e0"
  license "MIT"

  def install
    bin.install "tmexclude"
    bash_completion.install "completion/tmexclude.bash"
    zsh_completion.install "completion/_tmexclude"
    fish_completion.install "completion/tmexclude.fish"
    inreplace "launch.plist" do |s|
      s.gsub! "LABEL", plist_name.to_s
      s.gsub! "SELF_PATH", "#{bin}/tmexclude"
    end
    prefix.install "launch.plist" => "#{plist_name}.plist"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tmexclude --version")
  end
end
