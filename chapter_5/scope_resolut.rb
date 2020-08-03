# Constants can be defined inside class- and method-definition blocks.

module M
  class C
    X = 2

    class D
      module N
        X = 1
      end
    end

    puts D::N::X
  end
end

# You can refer to the module M, the class M::C, and so forth, down to the simple constant
puts M::C::D::N::X # 1
puts M::C::X # 2

class Violin
  class String
    attr_accessor :pitch

    def initialize(pitch)
      @pitch = pitch
    end
  end

  def initialize
    @e = String.new("E")
    @a = String.new("A")
  end

  def history
    # the :: in front of a constant means “start the search for this at the top level.”
    ::String.new(maker + ", " + date)
  end
end

