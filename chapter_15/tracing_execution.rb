def x
  y
end

def y
  z
end

def z
  puts "Stacktrace: "
  p caller
  # You may recognize the stack trace syntax from the messages you’ve seen from fatal errors.
  # If you rewrite the z method to look like this,
  # def z
  #   raise
  # end
  # The outlook will look pretty much the same as "p caller"
end

x
# ["/Users/willianantunes/Development/git-personal/tic-tac-toe-ruby-playground/chapter_15/tracing_execution.rb:6:in `y'",
# "/Users/willianantunes/Development/git-personal/tic-tac-toe-ruby-playground/chapter_15/tracing_execution.rb:2:in `x'",
# "/Users/willianantunes/Development/git-personal/tic-tac-toe-ruby-playground/chapter_15/tracing_execution.rb:14:in `<main>'"]

###############
# Writing a tool for parsing stack traces

module CallerTools
  class Call
    CALL_RE = /(.*):(\d+):in `(.*)'/
    attr_reader :program, :line, :meth

    def initialize(string)
      @program, @line, @meth = CALL_RE.match(string).captures
    end

    def to_s
      "%30s%5s%15s" % [program, line, meth]
    end
  end
end

module CallerTools
  class Stack
    def initialize
      stack = caller
      stack.shift
      @backtrace = stack.map do |call|
        Call.new(call)
      end
    end

    def report
      @backtrace.map do |call|
        call.to_s
      end
    end

    def find(&block)
      @backtrace.find(&block)
    end
  end
end

def x2
  y2
end

def y2
  z2
end

def z2
  stack = CallerTools::Stack.new
  # Nothing too fancy, but it’s a nice programmatic way to address a stack trace rather
  # than having to munge the strings directly every time
  puts stack.report
  # ["/Users/willianantunes/Development/git-personal/tic-tac-toe-ruby-playground/chapter_15/tracing_execution.rb:6:in `y'", "/Users/willianantunes/Development/git-personal/tic-tac-toe-ruby-playground/chapter_15/tracing_execution.rb:2:in `x'", "/Users/willianantunes/Development/git-personal/tic-tac-toe-ruby-playground/chapter_15/tracing_execution.rb:20:in `<main>'"]
  # /Users/willianantunes/Development/git-personal/tic-tac-toe-ruby-playground/chapter_15/tracing_execution.rb   74             z2
  # /Users/willianantunes/Development/git-personal/tic-tac-toe-ruby-playground/chapter_15/tracing_execution.rb   70             y2
  # /Users/willianantunes/Development/git-personal/tic-tac-toe-ruby-playground/chapter_15/tracing_execution.rb   66             x2
  # /Users/willianantunes/Development/git-personal/tic-tac-toe-ruby-playground/chapter_15/tracing_execution.rb   78         <main>
end

x2
