directory "/root/domain"

[
  "zitdev.pw",
  "test.zitdev.pw",
  "zmemo.pw",
].each do |domain|
  template "/root/domain/#{domain}.conf" do
    action :create
    source "templates/vhosts.erb"
    variables(domain: domain)
  end
end
