package "httpd"
#package "php"
#package "php-mbstring"
package "mod_ssl"

directory "/etc/httpd/conf.d/vhosts"
remote_file "/etc/httpd/conf/httpd.conf"
#remote_file "/etc/httpd/conf.d/vhosts/_http.conf"
#remote_file "/etc/httpd/conf.d/ssl.conf"
#remote_file "/etc/httpd/conf.d/vhosts/_ssl.conf"

=begin
[
  "zitdev.pw",
  "zmemo.pw"
].each do |domain|
  template "/etc/httpd/conf.d/vhosts/#{domain}.conf" do
    action :create
    source "templates/vhosts.erb"
    variables(domain: domain)
  end
  directory "/var/www/html/#{domain}"
  file "/var/www/html/#{domain}/index.html" do
    content %Q(
      Hello #{domain}!
    )
    mode "644"
  end
end

remote_file "/etc/httpd/conf.d/vhosts/test.zitdev.pw.conf"
directory "/var/www/html/test.zitdev.pw"
file "/var/www/html/test.zitdev.pw/index.php" do
  content %Q(<?php phpinfo();)
  mode "644"
  notifies :restart, "service[httpd]"
end
=end

#file "/etc/httpd/conf.d/welcome.conf" do
#  action :delete
#end

service "httpd" do
  action [:enable, :start]
end
