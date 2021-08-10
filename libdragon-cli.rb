class LibdragonCli < Formula
  desc "A tool for managing development of N64 ROMs with libdragon"
  homepage "https://github.com/rasky/libdragon-cli"
  url "https://github.com/rasky/libdragon-cli/archive/refs/tags/v0.1.tar.gz"
  sha256 "402d1e2b9c39a6d21345a4e076b802520ab01d7db1d4dc1b2552bd0004d320df"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
    regex(%r{href=.*?/tag/(?:libdragon-cli%2F)?v?(\d+(?:\.\d+)+)["' >]}i)
  end

  depends_on "libftdi"
  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    output = shell_output("#{bin}/gopls api-json")
    output = JSON.parse(output)

    assert_equal "gopls.add_dependency", output["Commands"][0]["Command"]
    assert_equal "buildFlags", output["Options"]["User"][0]["Name"]
  end
end
