case node["platform"]
when "rhel", "centos", "amazon"
  directory "/etc/sysctl.d" do
    group "root"
    owner "root"
    mode  "0755"
  end

  cookbook_file "/usr/local/bin/apply-sysctl" do
    owner "root"
    group "root"
    mode  "0755"

    source "apply-sysctl"
  end

  execute "apply-sysctl" do
    user  "root"
    group "root"

    command "/usr/local/bin/apply-sysctl"

    action :nothing
  end
when "debian", "ubuntu"
  service "procps" do
    supports :restart => true, :start => true, :stop => true
  end
end

sysctl "chef-static" do
  priority 65
  settings node['sysctl']
end
