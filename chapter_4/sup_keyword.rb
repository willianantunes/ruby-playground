module M
  def report
    puts "'report' method in module M"
  end
end

class C
  include M

  def report
    puts "'report' method in class C"
    puts "About to trigger the next higher-up report method..."
    # The super keyword gives you a way to call what would have been the applicable version of
    # a method in cases where that method has been overridden later in the lookup path
    super # it will call report on M module
    puts "Back from the 'super' call."
  end
end

c = C.new
c.report

# Result:
# 'report' method in class C
# About to trigger the next higher-up report method...
# 'report' method in module M
# Back from the 'super' call.


class Bicycle
  attr_reader :gears, :wheels, :seats

  def initialize(gears = 1)
    @wheels = 2
    @seats = 1
    @gears = gears
  end

  def rent
    puts "Sorry but this model is sold out."
  end
end

class Tandem < Bicycle
  def initialize(gears)
    super
    @seats = 2
  end

  def rent
    puts "This bike is available!"
  end
end


t = Tandem.new(5)
p t.method(:rent) #<Method: Tandem#rent>
t.method(:rent).call # This bike is available!
p t.method(:rent).super_method #<Method: Bicycle#rent>
t.method(:rent).super_method.call # Sorry, this model is sold out.

p t.method(:rent).super_method.super_method # nil
