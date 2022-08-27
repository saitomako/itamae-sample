ip = run_command(%Q(curl inet-ip.info;)).stdout.chomp
File.open("dns.txt", mod = "w"){|f|
  f.puts("a * #{ip}")
  f.puts("mx @ 10")
  f.puts("txt @ v=spf1 ip4:#{ip} ~all")
}
