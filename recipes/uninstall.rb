#Clean NFS mount

execute "clean mount" do
  cwd "/uge/root"
  command "rm -rf /uge/root/*"
end
