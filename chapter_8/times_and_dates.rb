# Times and dates are manipulated through three classes: Time, Date, and DateTime.
# (For convenience, the instances of all of these classes can be referred to collectively as date/time objects.)

require 'date'
require 'time'

puts Date.parse("April 24 1705").england.strftime("%B %d %Y") # April 13 1705
puts Date.today # 2020-08-08
p Date.today # <Date: 2020-08-08 ((2459070j,0s,0n),+0s,2299161j)>
puts Date.new(1959, 2, 1) # 1959-02-01
# If not provided, the month and day (or just day) default to 1
puts Date.new(1959) # 1959-01-01
puts Date.parse("2003/6/9") # 2003-06-09

puts "##############################"

# By default, Ruby expands the century for you if you provide a one- or two-digit number.
# If the number is 69 or greater, then the offset added is 1900; if it’s between 0 and 68,
# the offset is 2000. (This distinction has to do with the beginning of the Unix “epoch” at the start of 1970.)
puts Date.parse("03/6/9") # 2003-06-09
puts Date.parse("33/6/9") # 2033-06-09
puts Date.parse("77/6/9") # 1977-06-09

puts "##############################"

puts Date.parse("November 2 2013") # 2013-11-02
puts Date.parse("Nov 2 2013") # 2013-11-02
puts Date.parse("2 Nov 2013") # 2013-11-02
puts Date.parse("2013/11/2") # 2013-11-02

puts "##############################"

puts Time.new # 2020-08-08 15:11:20 -0300
puts Time.at(100000000) # 1973-03-03 06:46:40 -0300
puts Time.mktime(2007,10,3,14,3,6) # 2007-10-03 14:03:06 -0300
puts Time.parse("March 22, 1985, 10:35 PM") # 1985-03-22 22:35:00 -0300

puts "##############################"

puts DateTime.new(2009, 1, 2, 3, 4, 5) # 2009-01-02T03:04:05+00:00
puts DateTime.now # 2020-08-08T15:13:28-03:00
puts DateTime.parse("October 23, 1973, 10:34 AM") # 2020-08-08T15:13:28-03:00

puts "##############################"

dt = DateTime.now
puts dt.year # 2020
puts dt.hour # 15
puts dt.minute # 30
puts dt.second # 57
t = Time.now
puts t.month # 8
puts t.sec # 57
d = Date.today
puts d.day # 8


puts t.sunday? # false
puts d.saturday? # true
puts dt.friday? # false

t2 = Time.now
puts t2.strftime("%m-%d-%y") # 08-08-20
puts t2.strftime("%x") # 08/08/20
puts t2.strftime("%d/%m/%Y %H:%M:%S") # 08/08/2020 15:35:17

puts t2.strftime("Today is %x") # Today is 08/08/20
puts t2.strftime("Otherwise known as %d-%b-%y") # Otherwise known as 08-Aug-20
puts t2.strftime("Or even day %e of %B, %Y.") # Or even day  8 of August, 2020.
puts t2.strftime("The time is %H:%m.") # The time is 15:08.

puts Date.today.rfc2822 # Sat, 8 Aug 2020 00:00:00 +0000
puts Date.today.iso8601 # 2020-08-08
puts DateTime.now.httpdate # Sat, 08 Aug 2020 18:36:34 GMT
puts DateTime.now.iso8601 # 2020-08-08T15:37:22-03:00
puts Time.now.iso8601 # 2020-08-08T15:37:32-03:00
