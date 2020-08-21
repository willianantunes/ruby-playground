lam = lambda { puts "A lambda!" }
lam.call # A lambda!
p lam # #<Proc:0x00007fad59021d28@/Users/willianantunes/Development/git-personal/tic-tac-toe-ruby-playground/chapter_14/lambda.rb:1 (lambda)>

# Lambdas differ from procs in how they treat the return keyword.
# return inside a lambda triggers an exit from the body of the lambda to the code
# context immediately containing the lambda. return inside a proc triggers a return
# from the method in which the proc is being executed.

def return_test
  l = lambda { return }
  l.call
  puts "Still here!"
  p = Proc.new { return }
  p.call
  puts "You won't see this message!" # this guy is not executed
end

return_test

lam = -> { puts "hi" }
lam.call # hi

mult = ->(x,y) { x * y }
p mult.call(3,4) # 12
