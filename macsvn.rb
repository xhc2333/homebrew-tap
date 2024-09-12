# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Macsvn < Formula
  desc "Subversion with pristine on demand"
  homepage ""
  url "https://code-res-1257584459.cos.ap-guangzhou.myqcloud.com/SVN/MacSVN/subversion-1.15.0.tar.xz"
  sha256 "eb9e35da4ff43d7670072abbcbc646b2ddc5097688bae8c79983ca538c60dfe1"
  license ""

  def install
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"]
    include.install Dir["include/*"]
    share.install Dir["share/*"]

    bin_path = bin.to_s
    lib_path = lib.to_s

    system "install_name_tool", "-change", "/usr/local/svn/svn/lib/libsvn_client-1.0.dylib", "#{lib_path}/libsvn_client-1.0.dylib", "#{bin_path}/svn"
    system "install_name_tool", "-change", "/usr/local/svn/svn/lib/libsvn_wc-1.0.dylib", "#{lib_path}/libsvn_wc-1.0.dylib", "#{bin_path}/svn"
    system "install_name_tool", "-change", "/usr/local/svn/svn/lib/libsvn_ra-1.0.dylib", "#{lib_path}/libsvn_ra-1.0.dylib", "#{bin_path}/svn"
    system "install_name_tool", "-change", "/usr/local/svn/svn/lib/libsvn_diff-1.0.dylib", "#{lib_path}/libsvn_diff-1.0.dylib", "#{bin_path}/svn"
    system "install_name_tool", "-change", "/usr/local/svn/svn/lib/libsvn_ra_local-1.0.dylib", "#{lib_path}/libsvn_ra_local-1.0.dylib", "#{bin_path}/svn"
    system "install_name_tool", "-change", "/usr/local/svn/svn/lib/libsvn_repos-1.0.dylib", "#{lib_path}/libsvn_repos-1.0.dylib", "#{bin_path}/svn"
    system "install_name_tool", "-change", "/usr/local/svn/svn/lib/libsvn_fs-1.0.dylib", "#{lib_path}/libsvn_fs-1.0.dylib", "#{bin_path}/svn"
    system "install_name_tool", "-change", "/usr/local/svn/svn/lib/libsvn_fs_fs-1.0.dylib", "#{lib_path}/libsvn_fs_fs-1.0.dylib", "#{bin_path}/svn"
    system "install_name_tool", "-change", "/usr/local/svn/svn/lib/libsvn_fs_x-1.0.dylib", "#{lib_path}/libsvn_fs_x-1.0.dylib", "#{bin_path}/svn"
    system "install_name_tool", "-change", "/usr/local/svn/svn/lib/libsvn_fs_util-1.0.dylib", "#{lib_path}/libsvn_fs_util-1.0.dylib", "#{bin_path}/svn"
    system "install_name_tool", "-change", "/usr/local/svn/svn/lib/libsvn_ra_svn-1.0.dylib", "#{lib_path}/libsvn_ra_svn-1.0.dylib", "#{bin_path}/svn"
    system "install_name_tool", "-change", "/usr/local/svn/svn/lib/libsvn_ra_serf-1.0.dylib", "#{lib_path}/libsvn_ra_serf-1.0.dylib", "#{bin_path}/svn"
    system "install_name_tool", "-change", "/usr/local/svn/serf/lib/libserf-1.dylib", "#{lib_path}/serf/libserf-1.dylib", "#{bin_path}/svn"
    system "install_name_tool", "-change", "/usr/local/svn/svn/lib/libsvn_delta-1.0.dylib", "#{lib_path}/libsvn_delta-1.0.dylib", "#{bin_path}/svn"
    system "install_name_tool", "-change", "/usr/local/svn/svn/lib/libsvn_subr-1.0.dylib", "#{lib_path}/libsvn_subr-1.0.dylib", "#{bin_path}/svn"
    system "install_name_tool", "-change", "/usr/local/svn/sqlite-amalgamation/lib/libsqlite3.0.dylib", "#{lib_path}/sqlite/libsqlite3.0.dylib", "#{bin_path}/svn"
    system "install_name_tool", "-change", "/usr/local/opt/zlib/lib/libz.1.dylib", "#{lib_path}/zlib/libz.1.dylib", "#{bin_path}/svn"
    system "install_name_tool", "-change", "/usr/local/opt/apr-util/lib/libaprutil-1.0.dylib", "#{lib_path}/apr-util/libaprutil-1.0.dylib", "#{bin_path}/svn"
    system "install_name_tool", "-change", "/usr/local/opt/apr/lib/libapr-1.0.dylib", "#{lib_path}/apr/libapr-1.0.dylib", "#{bin_path}/svn"
    system "install_name_tool", "-change", "/usr/local/opt/gettext/lib/libintl.8.dylib", "#{lib_path}/gettext/libintl.8.dylib", "#{bin_path}/svn"
  end
end


