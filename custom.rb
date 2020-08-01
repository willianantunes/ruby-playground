def convert_to_fahrenheit(celsius)
  return (celsius * 9 / 5) + 32
end

celsius = 100
fahrenheit = (celsius * 9 / 5) + 32
puts "The result is "
puts fahrenheit
puts "."

p = RbConfig::CONFIG["bindir"]
puts p
# The Ruby interpreter’s load path is a list of directories in which it searches for files you ask it to load.
# You can see the names of these directories by examining the contents of the special global variable $: (dollar-colon)
puts $: