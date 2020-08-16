require 'pathname'

sample_file = File.expand_path("../init.rb")
path = Pathname.new(sample_file)
p path # #<Pathname:/Users/willianantunes/Development/git-personal/tic-tac-toe-ruby-playground/chapter_12/init.rb>
puts path.basename # init.rb
puts path.dirname # /Users/willianantunes/Development/git-personal/tic-tac-toe-ruby-playground/chapter_12
puts path.extname # .rb

path.ascend do |dir|
  puts "Next level up: #{dir}"
  # Next level up: /Users/willianantunes/Development/git-personal/tic-tac-toe-ruby-playground/chapter_12/init.rb
  # Next level up: /Users/willianantunes/Development/git-personal/tic-tac-toe-ruby-playground/chapter_12
  # Next level up: /Users/willianantunes/Development/git-personal/tic-tac-toe-ruby-playground
  # Next level up: /Users/willianantunes/Development/git-personal
  # Next level up: /Users/willianantunes/Development
  # Next level up: /Users/willianantunes
  # Next level up: /Users
  # Next level up: /
end

path.ascend do |dir|
  # The fact that dir is always a Pathname object means that it’s possible to call the basename method on it
  puts "Ascended to #{dir.basename}"
  # Ascended to init.rb
  # Ascended to chapter_12
  # Ascended to tic-tac-toe-ruby-playground
  # Ascended to git-personal
  # Ascended to Development
  # Ascended to willianantunes
  # Ascended to Users
  # Ascended to /
end
