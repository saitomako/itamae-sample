[
  "utsuri.jp"
].each do |domain|
  template "/etc/httpd/conf.d/vhosts/#{domain}.conf" do
    action :create
    source "templates/vhosts.erb"
    variables(domain: domain)
  end
  directory "/var/www/html/#{domain}" do
    not_if "test -d /var/www/html/#{domain}"
  end
  file "/var/www/html/#{domain}/index.html" do
    content %Q(
      Hello #{domain}!
    )
    mode "644"
    not_if "test -f /var/www/html/#{domain}/index.html"
  end
end

execute "systemctl restart httpd"
