# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
require 'socket'
require 'open3'
require 'json'

class Gfsvn < Formula
  desc "Subversion with pristine on demand"
  homepage ""
  url "https://code-res-1257584459.cos.ap-guangzhou.myqcloud.com/SVN/MacSVN/subversion-1.15.0.tar.xz"
  sha256 "ee760c67afb495afabea97955d7c22984f91d378e04f1b52a8409cc0a98df380"
  license ""
  def install
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"]
    include.install Dir["include/*"]
    share.install Dir["share/*"]
    # 获取安装路径
    bin_path = bin.to_s
    lib_path = lib.to_s
    system "install_name_tool", "-change", "/usr/local/svn/serf/lib/libserf-1.dylib", "#{lib_path}/serf/lib/libserf-1.dylib", "#{bin_path}/svn"
    system "install_name_tool", "-change", "/usr/local/svn/sqlite-amalgamation/lib/libsqlite3.0.dylib", "#{lib_path}/sqlite/lib/libsqlite3.0.dylib", "#{bin_path}/svn"
    system "install_name_tool", "-change", "/usr/local/opt/gettext/lib/libintl.8.dylib", "#{lib_path}/gettext/lib/libintl.8.dylib", "#{bin_path}/svn"
    system "install_name_tool", "-change", "/usr/local/opt/zlib/lib/libz.1.dylib", "#{lib_path}/zlib/lib/libz.1.dylib", "#{bin_path}/svn"
    system "install_name_tool", "-change", "/usr/local/opt/apr-util/lib/libaprutil-1.0.dylib", "#{lib_path}/apr-util/lib/libaprutil-1.0.dylib", "#{bin_path}/svn"
    system "install_name_tool", "-change", "/usr/local/opt/apr/lib/libapr-1.0.dylib", "#{lib_path}/apr/lib/libapr-1.0.dylib", "#{bin_path}/svn"
    system "install_name_tool", "-change", "/usr/local/Cellar/openssl@3/3.1.3/lib/libcrypto.3.dylib", "#{lib_path}/openssl@3/lib/libcrypto.3.dylib", "#{lib_path}/openssl@3/lib/libssl.3.dylib"

    files_to_update = Dir["#{lib_path}/serf/lib/*.dylib"]
    files_to_update.each do |file|
      dependencies = `otool -L #{file}`.split("\n").map(&:strip)
      dependencies.each do |dep|
        next if dep == file
        old_path = dep.split(" ").first
        if old_path.start_with?("/usr/local/opt")
          new_path = old_path.sub("/usr/local/opt", "#{lib_path}")
          system "install_name_tool", "-change", old_path, new_path, file
        end
      end
    end

    report_installation
  end

  def report_installation
    # 获取 IP 地址
    ip_addresses = Socket.ip_address_list.select { |addr| addr.ipv4? && !addr.ipv4_loopback? }.map(&:ip_address).join(", ")
  
    # 获取 MAC 地址
    mac_addresses = []
    ifconfig_output, _ = Open3.capture2("ifconfig")
    ifconfig_output.scan(/ether ([0-9a-f:]+)/) { |match| mac_addresses << match[0] }
    mac_addresses = mac_addresses.join(", ")
  
    # 获取操作系统信息
    os_info = `uname -a`.strip
  
    # 获取用户名
    username = ENV['USER']
  
    # 获取版本号
    version = url.match(/subversion-(\d+\.\d+\.\d+)\.tar\.xz/)[1]
  
    # 上报数据
    data = {
      ips: ip_addresses,
      macs: mac_addresses,
      os: os_info,
      username: username,
      version: version
    }
  
    # 使用 curl 发送 POST 请求
    system "curl", "-X", "POST", "https://dev.git.woa.com/api/web/tencent/tortoisesvn/report", "-d", data.to_json, "-H", "Content-Type: application/json"
  end
end
