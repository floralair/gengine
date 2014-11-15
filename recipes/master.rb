#Master of UGE

#mount "/uge/root" do
#	device "gridnfs.vpod.local:/uge/root"
#	fstype "nfs"
#	options "rw,vers=3,rsize=8192,wsize=8192,timeo=14,nointr"
#	action [:mount, :enable]
#end

#execute "disable-ssh-keycheck-root" do
#	command "ssh-keyscan -H gridslave1 >> /root/.ssh/known_hosts"
#end

=begin
execute "disable-ssh-keycheck-ugeadmin" do
	user "ugeadmin"
	command "ssh-keyscan -H slave1.vpod.local >> /home/ugeadmin/.ssh/known_hosts"
end



execute "search-and-add-key" do
	command "ssh-keyscan -t rsa,dsa HOST 2>&1 | sort -u - ~/.ssh/known_hosts > ~/.ssh/tmp_hosts cat ~/.ssh/tmp_hosts >> ~/.ssh/known_hosts"
end
=end
execute "uge-install" do
	cwd "/uge/root"
	command "./inst_sge -m -x -auto /uge/root/uge_configuration.conf"
	creates "/uge/root/default/common/cluster_name"
end

execute "qconf-setup" do
	cwd "/uge/root"
	command "./initial_qconf.sh"
	creates "/uge/root/initial_qconf.done"
end

execute "clear iptables" do
	cwd "/uge/root"
	command "iptables -F"
end
