class G64drive < Formula
  desc "A tool for operating 64drive by Retroactive"
  homepage "https://github.com/rasky/g64drive"
  url "https://github.com/rasky/g64drive/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "4cac4075ebe44d5a620ce57d52f039e650e33bdb490f4148d255445409d8fdf4"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
    regex(%r{href=.*?/tag/(?:g64drive%2F)?v?(\d+(?:\.\d+)+)["' >]}i)
  end

  depends_on "libftdi"
  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end
end
