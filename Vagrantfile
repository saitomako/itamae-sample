VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.username = 'root'
  config.ssh.pty      = true

  config.vm.provider :conoha do |conoha|
    conoha.openstack_auth_url = 'https://identity.tyo1.conoha.io/v2.0'

    # API の設定
    conoha.username           = 'xxxxxxxxxx'
    conoha.password           = 'xxxxxxxxxx'
    conoha.tenant_name        = 'xxxxxxxxxxxx'

    conoha.flavor             = 'g-1gb'
    conoha.image              = 'vmi-centos-7.8-amd64'

    # VPS の設定
    root_user_password        = "xxxxxxxx"
    instance_name_tag         = "centos7-01"

    conoha.region             = "tyo1"
    conoha.admin_pass         = root_user_password
    conoha.metadata           = {
      instance_name_tag: instance_name_tag
    }
    conoha.security_groups    = [
      "default",
      "gncs-ipv4-all",
      "gncs-ipv6-all",
    ]
    conoha.keypair_name       = "keyname"
    conoha.sync_method        = "none"
  end
  config.ssh.private_key_path = "~/.ssh/id_rsa"
end
