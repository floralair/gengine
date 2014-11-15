#
# Cookbook Name:: gengine
# Recipe:: default
#
# Copyright 2014, Andrew Nelson
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#hosts = search(:node, "*:*")
#template "/etc/hosts" do
#  source "hosts.erb"
#  owner "root"
#  group "root"
#  mode 0644
#  variables(
#    :hosts => hosts,
#    :hostname => node[:hostname],
#    :fqdn => node[:fqdn]
#  )
#end


user "ugeadmin" do
	supports :manage_home => true
	comment "UGE Admin"
	uid 1234
	gid "users"
	home "/home/ugeadmin"
	shell "/bin/bash"
	password "$1$KiyeRecV$djdasp3PwYXCbP8k0ihjs1"
end

user "nelsonad" do
	supports :manage_home => true
	comment "example grid user"
	uid 1235
	gid "users"
	home "/home/nelsonad"
	shell "/bin/bash"
	password "$1$o3AIBTxH$R.1sCQPUdtej0qKybtO4I1"
end

directory "/uge" do
	owner "ugeadmin"
	group "users"
	mode 00755
	action :create
end

directory "/uge/root" do
	owner "ugeadmin"
	group "users"
	mode 00755
	action :create
end

directory "/root/.ssh/" do
	owner "root"
	group "root"
	mode 00700
	action :create
end

directory "/home/ugeadmin/.ssh/" do
	owner "ugeadmin"
	group "users"
	mode 00700
	action :create
end
cookbook_file "/root/.ssh/authorized_keys" do
	source "authorized_keys"
	mode 00700
	owner "root"
	group "root"
end
cookbook_file "/home/ugeadmin/.ssh/authorized_keys" do
	source "authorized_keys"
	mode 00700
	owner "ugeadmin"
	group "users"
end

cookbook_file "/root/.ssh/id_rsa" do
	source "id_rsa.root"
	mode 00600
	owner "root"
	group "root"
end

cookbook_file "/home/ugeadmin/.ssh/id_rsa" do
	source "id_rsa.ugeadmin"
	mode 00600
	owner "ugeadmin"
	group "users"
end

cookbook_file "/root/.ssh/id_rsa.pub" do
	source "id_rsa.pub.root"
	mode 00644
	owner "root"
	group "root"
end

cookbook_file "/home/ugeadmin/.ssh/id_rsa.pub" do
	source "id_rsa.pub.ugeadmin"
	mode 00644
	owner "ugeadmin"
	group "users"
end
cookbook_file "/root/.bashrc" do
	source ".bashrc"
	mode 00700
	owner "root"
	group "root"
end

cookbook_file "/home/ugeadmin/.bashrc" do
	source ".bashrc"
	mode 00700
	owner "ugeadmin"
	group "users"
end

cookbook_file "/home/nelsonad/.bashrc" do
	source ".bashrc"
	mode 00700
	owner "nelsonad"
	group "users"
end


