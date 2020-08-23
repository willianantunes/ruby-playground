CONSTANT = "can't change me!"
CONSTANT.gsub!(/can\'t/, 'can')
p CONSTANT # "can change me!"

CONSTANT.freeze
begin
  CONSTANT.gsub!(/can/, 'can\'t')
rescue FrozenError => e
  puts "You got: #{e.message}"
  puts "Is CONSTANT froze? #{CONSTANT.frozen?}"
end
