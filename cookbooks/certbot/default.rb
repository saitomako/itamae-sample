package "epel-release"

package "jq" do
  options "--enablerepo=epel"
end

package "certbot" do
  options "--enablerepo=epel"
end

remote_directory "/root/letsencrypt-dns-conoha" do
  source "files/letsencrypt-dns-conoha"
end

[
  "utsuri.jp"
].each do |domain|
execute "create conoha dns for #{domain}" do
  command %Q(
    certbot certonly \
    --manual \
    --agree-tos \
    --no-eff-email \
    --manual-public-ip-logging-ok \
    --preferred-challenges dns-01 \
    --server https://acme-v02.api.letsencrypt.org/directory \
    -d "#{domain}" \
    -d "*.#{domain}" \
    -m "saitomako@gmail.com" \
    --manual-auth-hook /root/letsencrypt-dns-conoha/create_conoha_dns_record.sh \
    --manual-cleanup-hook /root/letsencrypt-dns-conoha/delete_conoha_dns_record.sh
  )
  not_if "test -d /etc/letsencrypt/live/#{domain}"
end
end
