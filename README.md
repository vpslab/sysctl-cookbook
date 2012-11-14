Description
===========

Manage kernel parameters.

Requirements
============

Tested on Debian but should work on any *nix system.

Attributes
==========

`node['sysctl']` - namespace to define kernel parameters

    :sysctl => {
      :net => {
        :ipv4 => {
          :tcp_tw_recycle => 1,
          :tcp_max_syn_backlog => 2000
        }
      }
    }


Also strings can be used if to avoid deep hashes.

    :sysctl => { "net.ipv4.ip_forward" => 1 }

Both styles can be mixed.

Generated parameters will be put in `/etc/sysctl.d/65-chef-static.conf`.

Sysctl Resource
================

It can be used to manage sysctl settings in recipies.

    include_recipe "sysctl"

    sysctl "enable ip forwarding" do
      settings(
        "net.ipv4.ip_forward" => 1,
        "kernel.printk" => "4 4 1 7"
      )
    end

It will generate `/etc/sysctl.d/70-enable_ip_forwading.conf` and reload sysctl.

Priority defaults to 70 but can be customized.

    sysctl "enable ip forwarding" do
      priority 50
      settings "net.ipv4.ip_forward" => 1
    end

The generated config will be named `50-enable_ip_forwarding.conf`.

License and Author
==================

Author:: Michał Łomnicki (<michal.lomnicki@gmail.com>)

Copyright:: 2012, VPSLab

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
