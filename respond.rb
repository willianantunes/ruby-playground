obj = Object.new
if obj.respond_to?("talk")
  obj.talk
else
  puts "Sorry, the object doesn't understand the 'talk' message."
end


obj = Object.new

def obj.one_arg(x)
  p x
end

def obj.multi_args(*x)
  p x #[1, 2, 3]
end

def obj.two_or_more(a,b,*c)
  p a, b, c # 1 2 [3, "calopsita"]
end


obj.multi_args(1, 2, 3)
obj.two_or_more(1, 2, 3, "calopsita")

def default_args(a,b,c=1)
  puts "Values of variables: ",a,b,c
end

default_args(1, 2)


def mixed_args(a,b,*c,d)
  puts "Arguments:"
  p a,b,c,d
end

mixed_args(1,2,3,4,5) # 1, 2, [3, 4], 5
mixed_args(1,2,3) # 1, 2, 3