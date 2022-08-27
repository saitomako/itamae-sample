execute "yum update" do
  command "yum -y update"
end

package "yum-cron"
remote_file "/etc/yum/yum-cron.conf"
service "yum-cron" do
  action [:enable, :start]
end

package "epel-release"

package "http://rpms.famillecollet.com/enterprise/remi-release-7.rpm" do
  not_if 'rpm -q remi-release'
end
