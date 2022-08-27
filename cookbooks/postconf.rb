output = run_command(%Q(postconf -n;))
File.open("postconf.txt", mod = "w"){|f|
  f.write(output.stdout)
}
