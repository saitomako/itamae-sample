ipaddr = run_command(%Q(curl inet-ip.info;)).stdout.chomp
puts ipaddr
