class Tmexclude < Formula
  desc "Exclude undesired files (node_modules, target, etc) from your TimeMachine backup"
  homepage "https://github.com/PhotonQuantum/tmexclude"
  url "https://github.com/PhotonQuantum/tmexclude/archive/refs/tags/v0.1.0-alpha.1.tar.gz"
  sha256 "6df042debdb91e85bc48ad0f928037edff7b4a3c37ba36243a9897e4ad933ff9"
  license "MIT"

  bottle do
    root_url "https://github.com/PhotonQuantum/homebrew-tap/releases/download/tmexclude-0.1.0-alpha.1"
    sha256 cellar: :any_skip_relocation, big_sur: "fde4e7fbf2b8b490bb81b9b6521dd8c5b9939871e16ffc71c83eb63c5667b6a6"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  service do
    run [opt_bin/"tmexclude", "daemon"]
    run_type :immediate
    process_type :background
    keep_alive false
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tmexclude --version")
  end
end
