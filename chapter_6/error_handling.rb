def honest_sample
  print "Enter a number: "
  n = gets.to_i
  begin
    result = 100 / n
    # You can refine this technique by pinpointing the exception you want to trap.
    # Instead of a generic rescue instruction, which rescues any error that’s a descendant class of StandardError.
    # rescue ZeroDivisionError
  rescue
    puts "Your number didn't work. Was it zero???"
    exit
  end
  puts "100/#{n} is #{result}."
end

# honest_sample

def open_user_file
  print "File to open: "
  filename = gets.chomp
  begin
    fh = File.open(filename)
  rescue
    puts "Couldn't open your file!"
    return
  end
  yield fh
  fh.close
end

# open_user_file

open_user_file do |filename|
  fh = File.open(filename)
  yield fh
  fh.close
rescue
  puts "Couldn't open your file!"
end
