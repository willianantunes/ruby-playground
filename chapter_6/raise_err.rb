def fussy_method(x)
  raise ArgumentError, "I need a number under 10" unless x < 10
  # raise "Problem!"
  # raise RuntimeError, "Problem!"
end

# fussy_method(20)


begin
  fussy_method(20)
rescue ArgumentError
  puts "FIRST That was not an acceptable number!"
end


begin
  fussy_method(20)
rescue ArgumentError => e
  puts "SECOND That was not an acceptable number!"
  puts "Here's the backtrace for this exception:"
  puts e.backtrace
  puts "And here's the exception object's message:"
  puts e.message
end

def another_sample_1
  filename = "salted-man"
  begin
    fh = File.open(filename)
  rescue => e
    puts("User tried to open #{filename}, #{Time.now}")
    puts("Exception: #{e.message}")
    # User tried to open salted-man, 2020-08-05 20:04:57 -0300
    # Exception: No such file or directory @ rb_sysopen - salted-man
    raise
  end
end

another_sample_1
