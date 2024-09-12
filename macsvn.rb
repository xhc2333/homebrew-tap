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

    # 获取安装路径
    bin_path = bin.to_s
    lib_path = lib.to_s
    parent_dir = File.dirname(lib_path)

    # 定义需要更新的文件列表
    files_to_update = ["#{bin_path}/svn"] + Dir["#{lib_path}/*.dylib"]

    files_to_update.each do |file|
      # 使用 otool 检查依赖关系
      dependencies = `otool -L #{file}`.split("\n").map(&:strip)
      dependencies.each do |dep|
        next if dep == file # 跳过自身引用
        old_path = dep.split(" ").first
        if old_path.start_with?("/usr/local/svn/svn")
          new_path = old_path.sub("/usr/local/svn/svn", "#{parent_dir}")
          system "install_name_tool", "-change", old_path, new_path, file
        elsif old_path.start_with?("/usr/local/svn/serf")
          new_path = old_path.sub("/usr/local/svn", "#{lib_path}")
          system "install_name_tool", "-change", old_path, new_path, file
        elsif old_path.start_with?("/usr/local/opt")
          new_path = old_path.sub("/usr/local/opt", "#{lib_path}")
          system "install_name_tool", "-change", old_path, new_path, file
        end
      end
    end
  end
end


