module Tools
  # Nested module/class chains like Tools::Hammer are sometimes used to create
  # separate namespaces for classes, modules, and methods
  class Hammer
  end
end

# double-colon constant lookup token (::) to point the way to the name of the class
h = Tools::Hammer.new