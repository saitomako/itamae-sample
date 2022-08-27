service "caddy" do
  action [:disable, :stop]
end

=begin
package "yum-plugin-copr"

execute "copr enable" do
  command %Q(yum -y copr enable @caddy/caddy)
end

package "caddy"

user "caddy" do
  system_user true
  gid "caddy"
  create_home true
  home "/var/lib/caddy"
  shell "/sbin/nologin"
end

remote_file "/etc/systemd/system/caddy.service"

service "caddy" do
  action [:enable, :start]
end

directory "/etc/caddy" do
  owner "root"
  group "caddy"
  notifies :restart, "service[caddy]"
end

directory "/etc/ssl/caddy" do
  owner "caddy"
  group "caddy"
  mode "770"
end

directory "/var/log/caddy" do
  owner "caddy"
  group "caddy"
end

directory "/var/www" do
  owner "caddy"
  group "caddy"
end

file "/var/www/index.html" do
  content "<h1>Hello World</h1>"
end

remote_file "/etc/caddy/Caddyfile" do
  owner "caddy"
  group "caddy"
  notifies :restart, "service[caddy]"
end
=end
