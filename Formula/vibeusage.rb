class Vibeusage < Formula
  desc "Track AI coding tool usage quotas from your terminal"
  homepage "https://github.com/joshuadavidthomas/vibeusage"
  url "https://github.com/joshuadavidthomas/vibeusage/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "e5a24ae8fe2333f3f4e8d713c2beed74a72b55e79b6b4d936e5a9dc535f2dade"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/joshuadavidthomas/vibeusage/internal/cli.version=#{version}"
    system "go", "build", *std_go_args(ldflags:, output: bin/"vibeusage"), "./cmd/vibeusage"
  end

  test do
    output = shell_output("#{bin}/vibeusage --version")
    assert_match "vibeusage", output
    assert_match version.to_s, output
  end
end
