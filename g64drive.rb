class G64drive < Formula
  desc "A tool for operating 64drive by Retroactive"
  homepage "https://github.com/rasky/g64drive"
  url "https://github.com/rasky/g64drive/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "5a3333587f090e7b5cbccbe8efccf3fb585aeefe5692e80a76269fc718495534"
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
