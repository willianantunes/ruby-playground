require 'open-uri'

# The open-uri standard library package lets you retrieve information from the network
# using the HTTP and HTTPS protocols as easily as if you were reading local files
rubypage = open("http://rubycentral.org")
# You get back a StringIO object containing the results of your request
puts rubypage.gets
