maintainer       "VPSLab"
maintainer_email "michal.lomnicki@gmail.com"
name             "sysctl"
license          "Apache 2.0"
description      "Configures sysctl"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.2"

%w(ubuntu debian redhat centos).each do |os|
  supports os
end
