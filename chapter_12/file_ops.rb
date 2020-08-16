full_text = File.read("my-file.txt")
lines_of_text = File.readlines("my-file.txt")

File.open("output.txt", "w") do |f|
  f.print("Hello")
  f.syswrite(" there!")
end

puts File.read("output.txt")


def writing_test
  f = File.new("data.out", "w")
  f.puts "Willian Antunes, Rubyist"
  f.close
  puts File.read("data.out")
  # Willian Antunes, Rubyist
  f = File.new("data.out", "a")
  f.puts "Jafar, Rubyist"
  f.close
  puts File.read("data.out")
  # Willian Antunes, Rubyist
  # Jafar, Rubyist
end

writing_test


