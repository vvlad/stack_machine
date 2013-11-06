class StackMachine::Stack < Array

  StackError = Class.new(RuntimeError)
  UnderflowError = Class.new(StackError)
  OverflowError = Class.new(StackError)

  attr_accessor :stack_size
  def initialize(size=1_000_000)
    @stack_size = size
    super()
  end


  def pop
    value = super
    raise UnderflowError unless value
    value
  end


  def push(value)
    if count < stack_size
      super
    else
      raise OverflowError
    end
  end


end
