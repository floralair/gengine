uge_root = '/uge/root'

mount "/uge/root" do
	device "mygrid1-master-0.vpod.local:/uge/root"
	fstype "nfs"
	options "rw,vers=3,rsize=8192,wsize=8192,timeo=14,nointr"
	action [:mount, :enable]
end


