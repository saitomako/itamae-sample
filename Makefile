.DEFAULT_GOAL	:= default
TARGET	:= mixhost:~/public_html/sample.com
OPTIONS	:= --style compact

create:
	vagrant up

stop:
	vagrant halt

delete:
	vagrant destroy

getdns:
	itamae ssh --host cono cookbooks/getdns.rb --log-level DEBUG

yum:
	itamae ssh --host cono roles/yum.rb --log-level DEBUG

hostname:
	itamae ssh --host cono roles/hostname.rb --log-level DEBUG

yumlist:
	itamae ssh --host cono roles/yumlist.rb

# 自宅PCからのみSSHアクセス制限する 自宅IP変更時はpublic.xmlを変更する必要あり
firewalld:
	itamae ssh --host cono roles/firewalld.rb

# user作成
homeragi:
	itamae ssh --host cono roles/homeragi.rb

httpd:
	itamae ssh --host cono roles/httpd.rb

php74:
	itamae ssh --host cono roles/php74.rb --log-level DEBUG

certbot:
	itamae ssh --host cono roles/certbot.rb --log-level DEBUG

vhosts:
	itamae ssh --host cono roles/vhosts.rb --log-level DEBUG

# caddy --- 簡単web server 今後は使わないと思う
caddy:
	itamae ssh --host cono roles/caddy.rb

postfix:
	itamae ssh --host cono roles/postfix.rb --log-level DEBUG

postconf:
	itamae ssh --host cono cookbooks/postconf.rb --log-level DEBUG

default:
	@echo "DO NOTHING!"
