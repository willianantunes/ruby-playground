# Tail-call optimization unburdens the Ruby interpreter by allowing tail-recursive functions to be evaluated
# without adding successive stack frames to the call stack. When the call stack remains constant, we
# avoid stack overflow errors and can recurse many thousands of times through a function
# without exhausting system resources.

# You can enable tail-call optimization by setting compile options on the RubyVM::InstructionSequence class
RubyVM::InstructionSequence.compile_option = {
    tailcall_optimization: true,
    trace_instruction: false
}

def fibonacci_helper(x, y, num)
  num < 1 ? x : fibonacci_helper(y, x + y, num - 1)
end

def fibonacci(x)
  fibonacci_helper(0, 1, x)
end

p fibonacci 1000
