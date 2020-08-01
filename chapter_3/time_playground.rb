puts Time.new.strftime("%m-%d-%y")

class Time
  def calopsita
    puts 123456
  end
end

puts Time.new.calopsita

t = Time.new
puts t

begin
  t.xmlschema
# rescue
rescue Exception => ex
  puts "an error was launched! #{ex}"
end

require 'time'

puts t.xmlschema