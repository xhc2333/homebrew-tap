# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Macsvn < Formula
  desc "Subversion with pristine on demand"
  homepage ""
  url "https://code-res-1257584459.cos.ap-guangzhou.myqcloud.com/SVN/MacSVN/subversion-1.15.0.tar.xz"
  sha256 "1ecfd02924fff74048ec7412c292ac9c906b8a3b28b6f03371987eab67eff7d1"
  license ""

  depends_on "serf"

  def install
    bin.install "svn"
  end

  test do
    system "#{bin}/svn", "--version"
  end
end


