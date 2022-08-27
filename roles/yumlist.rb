result = run_command('yum list installed', error: false)
File.open("yumlist.txt", mode = "w"){|f|
  f.write(result.stdout)
}
