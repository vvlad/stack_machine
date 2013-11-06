
class StackMachine

  IlegalInstructionError = Class.new(RuntimeError)
  autoload :Stack, 'stack_machine/stack'

  INSTRUCTIONS = {
    '*' => ->(left,right) { left * right },
    '+' => ->(left,right) { left + right }
  }

  attr :stack, :instructions
  def initialize
    @stack = Stack.new
    @instructions = {}
  end


  def stack_machine_emulator(input)
    input.each_char do |char|
      value = case char
      when '0'..'9' then char.to_i
      when *INSTRUCTIONS.keys then INSTRUCTIONS[char][stack.pop, stack.pop]
      else raise IlegalInstructionError
      end
      stack.push value
    end
    stack.last
  rescue IlegalInstructionError, Stack::StackError
    return -1
  end




end
