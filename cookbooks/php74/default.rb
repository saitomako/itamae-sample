%w( php php-mbstring php-xml php-xmlrpc php-gd php-intl php-json php-pdo php-pecl-mcrypt php-mysqlnd php-pecl-mysql ).each do |pkg|
  package pkg do
    options "--enablerepo=remi-php74"
    action :install
  end
end
