class Tmexclude < Formula
  desc "Exclude undesired files (node_modules, target, etc) from your TimeMachine backup"
  homepage "https://github.com/PhotonQuantum/tmexclude"
  url "https://github.com/PhotonQuantum/tmexclude/releases/download/v0.1.0-alpha.2.post.4/tmexclude-0.1.0-alpha.2.post.4.tar.gz"
  sha256 "e90a70689cfb3367913d8f92db25040e535d738085a38972bd92d4c6b49d6b63"
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
