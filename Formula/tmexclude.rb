class Tmexclude < Formula
  desc "Exclude undesired files (node_modules, target, etc) from your TimeMachine backup"
  homepage "https://github.com/PhotonQuantum/tmexclude"
  url "https://github.com/PhotonQuantum/tmexclude/releases/download/v0.1.0-alpha.2.post.3/tmexclude-0.1.0-alpha.2.post.3.tar.gz"
  sha256 "efaed017fe55b2c57fea291a07f9bdd47adc59b5100104f2528452af63159b7e"
  license "MIT"

  def install
    bin.install "tmexclude"
    bash_completion.install "completion/tmexclude.bash"
    zsh_completion.install "completion/_tmexclude"
    fish_completion.install "completion/tmexclude.fish"
    inreplace "launch.plist", "LABEL", plist.to_s
    inreplace "launch.plist", "SELF_PATH", "#{bin}/tmexclude"
    prefix.install_symlink "launch.plist" => "#{plist_name}.plist"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tmexclude --version")
  end
end
