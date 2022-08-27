package "postfix"
remote_file "/etc/postfix/main.cf" do
  mode "644"
end

package "telnet"
