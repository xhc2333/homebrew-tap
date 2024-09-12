# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Macsvn < Formula
  desc "Subversion with pristine on demand"
  homepage ""
  url "https://code-res-1257584459.cos.ap-guangzhou.myqcloud.com/SVN/MacSVN/subversion-1.15.0.tar.xz"
  sha256 ""
  license ""

  depends_on "serf"
  depends_on "apr"
  depends_on "apr-util"
  depends_on "zlib"

  def install
    bin.install "svn"
  end

  test do
    system "#{bin}/svn", "--version"
  end
end


