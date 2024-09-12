# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Macsvn < Formula
  desc "Subversion with pristine on demand"
  homepage ""
  url "https://code-res-1257584459.cos.ap-guangzhou.myqcloud.com/SVN/MacSVN/subversion-1.15.0.tar.xz"
  sha256 "7319d58bb44d29bdac0bf662d1e02d6f45b810f975f963c15280ecdeaea08976"
  license ""

  def install
    bin.install "svn"
  end

  test do
    system "#{bin}/svn", "--version"
  end
end


