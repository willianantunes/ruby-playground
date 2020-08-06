def line_from_file(filename, substring)
  fh = File.open(filename)
  begin
    line = fh.gets
    raise ArgumentError unless line.include?(substring)
  rescue ArgumentError
    puts "Invalid line!"
    raise
  ensure
    fh.close
  end
  return line
end

class InvalidLineError < StandardError
end

def refactored_line_from_file(filename, substring)
  fh = File.open(filename)
  line = fh.gets
  raise InvalidLineError unless line.include?(substring)
  return line
rescue InvalidLineError
  puts "Invalid line!"
  raise
ensure
  fh.close
end

class MyNewException < Exception
end

begin
  puts "About to raise exception..."
  raise MyNewException
rescue MyNewException => e
  puts "Just raised an exception: #{e}"
end


# Namespacing exceptions this way is polite, in the sense that it lets other people name
# exceptions as they like without fearing name clashes. It also becomes a necessity once
# you start creating more than a very small number of exception classes.
module TextHandler
  class InvalidLineError < StandardError
  end
end

def re_2_line_from_file(filename, substring)
  fh = File.open(filename)
  line = fh.gets
  raise TextHandler::InvalidLineError unless line.include?(substring)
end
