# To kill a thread, you send it the message kill, exit, or terminate; all three are equivalent.
# Or, if you’re inside the thread, you call kill (or similar) in class-method form

puts "Trying to read in some files..."
text = []
t = Thread.new do
  (0..2).each do |n|
    begin
      File.open("part0#{n}") do |f|
        text << f.readlines
      end
    rescue Errno::ENOENT
      puts "Message from
        thread: Failed on n=#{n}"
      Thread.exit
    end
  end
end
t.join
puts "Finished!"

## The output, assuming part00 exists but part01 doesn’t, is this:
# Trying to read in some files...
# Message from
#         thread: Failed on n=1
# Finished!
