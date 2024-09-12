# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Macsvn < Formula
  desc "Subversion with pristine on demand"
  homepage ""
  url "https://code-res-1257584459.cos.ap-guangzhou.myqcloud.com/SVN/MacSVN/subversion-1.15.0.tar.xz"
  sha256 "b399d5a838ee34f84830863ad66355929cbf2db23d12255caf3d5fb9f5463cb1"
  license ""

  depends_on "serf"

  def install
    bin.install "svn"
  end

  test do
    system "#{bin}/svn", "--version"
  end
end


