package "firewalld"

service "firewalld" do
  action [:enable, :start]
end

remote_file "/etc/firewalld/zones/public.xml" do
  notifies :reload, "service[firewalld]"
end
