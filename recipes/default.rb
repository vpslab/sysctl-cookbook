service "procps" do
  supports :restart => true, :start => true, :stop => true
end

sysctl "chef-static" do
  priority 65
  settings node['sysctl']
end
