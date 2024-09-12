# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Macsvn < Formula
  desc "Subversion with pristine on demand"
  homepage ""
  url "https://code-res-1257584459.cos.ap-guangzhou.myqcloud.com/SVN/MacSVN/subversion-1.15.0.tar.xz"
  sha256 "eb9e35da4ff43d7670072abbcbc646b2ddc5097688bae8c79983ca538c60dfe1"
  license ""

  depends_on "serf"

  def install
    bin.install "svn"
  end

  test do
    system "#{bin}/svn", "--version"
  end
end


