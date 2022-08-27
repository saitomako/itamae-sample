USER_NAME = "homeragi"
SSH_KEY = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDGU9fhQGL0NudOCfF3byL+BLZ5nrkjC+n04XaFPJ4/yiQjLv0j/j85hs2hEDv9mX0YGl9iTvkdpeZiisf5RVUrai0hr2qURaZV2kyzd3D6HZ1yqNRzD5pZ5YrzaezM+vHjU4pQ/oslqvDpM4rCX3fIX2/AQCzlL79XIfqEn0uQjnzWferOyYqoJqUBuy8PgLaYjvgBfy8YdvuIfdQsTI5napUbP8y1b2jTQyLUCNyJ+cLaccjzgx8ZKnw1yyghUuQQQGjJ7fQ29xb81jbhnu0NSCftpHLX/uY05Rw9TY3FVC0ulIBqWupc02rdPB2tbG1eZaErz2iunDJNGxh3KHEf makoto@oopy"
WHEEL_GID = "10"

user USER_NAME do
  password "$6$salt$QlwpbiLhPtnwfyOg75uYXk9mKYAbnTKzCKlun4isy2SRiw1XFyYawIhE92gDFgugmz2v1foESAsA0JhWDiOFv."
end

execute "usermod add wheel group" do
  command "usermod -aG wheel #{USER_NAME}"
end

directory "/home/#{USER_NAME}" do
  owner USER_NAME
  group USER_NAME
  mode "755"
end

directory "/home/#{USER_NAME}/.ssh" do
  owner USER_NAME
  group USER_NAME
  mode "755"
end

file "/home/#{USER_NAME}/.ssh/authorized_keys" do
  content SSH_KEY
  owner USER_NAME
  group USER_NAME
  mode "600"
end
