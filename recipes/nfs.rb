#NFS server

package_name = 'nfs-utils'
lib_name = 'nfs-utils-lib'
service_name = 'nfs'
uge_root = '/uge/root'

if platform_family? 'rhel'
	package_name = 'nfs-utils'
	service_name = 'nfs'
end

if platform_family? 'rhel'
	lib_name = 'nfs-utils-lib'
end

package package_name do
	action :install
end

package lib_name do
	action :install
end

service service_name do
	action [ :enable, :start ]
end

cookbook_file "/etc/exports" do
	source "exports"
	mode 00755
	owner "root"
	group "root"
end

execute "nfs export" do
	command "exportfs -a"
	action :run
end

cookbook_file "/uge/root/ge-8.1.7p3-bin-lx-amd64.tar.gz" do
	source "ge-8.1.7p3-bin-lx-amd64.tar.gz"
	mode 00755
	owner "ugeadmin"
	group "users"
end

cookbook_file "/uge/root/ge-8.1.7p3-common.tar.gz" do
	source "ge-8.1.7p3-common.tar.gz"
	mode 00755
	owner "ugeadmin"
	group "users"
end

cookbook_file "/uge/root/uge_configuration.conf" do
	source "uge_configuration.conf"
	mode 00755
	owner "ugeadmin"
	group "users"
end

cookbook_file "/uge/root/initial_qconf.sh" do
	source "initial_qconf.sh"
	mode 00755
	owner "ugeadmin"
	group "users"
end

execute "untar-ge-common" do
	cwd "/uge/root"
	command "tar -xzf ge-8.1.7p3-common.tar.gz"
	creates "/uge/root/inst_sge"
end

execute "untar-ge-bin" do
	cwd "/uge/root"
	command "tar -xzf ge-8.1.7p3-bin-lx-amd64.tar.gz"
	creates "/uge/root/bin"
end
