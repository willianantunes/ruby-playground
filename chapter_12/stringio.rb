module DeCommenter
  def self.decomment(infile, outfile, comment_re = /\A\s*#/)
    infile.each do |inline|
      outfile.print inline unless inline =~ comment_re
    end
  end
end

File.open("init.rb") do |inf|
  File.open("myprogram.rb.out", "w") do |outf|
    DeCommenter.decomment(inf, outf)
  end
end

# What if you want to write a test for the DeCommenter module?
# Testing file transformations can be difficult, because you need to maintain the input file
# as part of the test and also make sure you can write to the output file—which you then have to read back in.
# StringIO makes it easier by allowing all the code to stay in one place without the need to read or write actual files

require 'stringio'

string = <<EOM
# This is a comment.
This isn't a comment.
# This is.
   # So is this.
This is also not a comment.
EOM

infile = StringIO.new(string)
outfile = StringIO.new("")

DeCommenter.decomment(infile,outfile)

puts "Test succeeded" if outfile.string == <<EOM
This isn't a comment.
This is also not a comment.
EOM
