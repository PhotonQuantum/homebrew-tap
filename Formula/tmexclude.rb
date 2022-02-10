class Tmexclude < Formula
  desc "Exclude undesired files (node_modules, target, etc) from your TimeMachine backup"
  homepage "https://github.com/PhotonQuantum/tmexclude"
  url "https://github.com/PhotonQuantum/tmexclude/releases/download/v0.1.0/tmexclude-0.1.0.tar.gz"
  sha256 "e567804d37c12d8658cb367978dbb03802dc16d0ac5c54036e53863d4513e8db"
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
