require 'spec_helper'



describe StackMachine::Stack do

  let(:stack) { StackMachine::Stack.new }

  describe "pushing a value into the stack" do

    it "should add the value to the tail of the stack " do
      stack.push 1
      expect(stack).to eq [1]
      stack.push 2
      expect(stack).to eq [1,2]
    end

    it "should raise an error if the stack is overflowing" do
      stack = StackMachine::Stack.new(0)
      expect{stack.push 1}.to raise_error StackMachine::Stack::OverflowError
    end

  end

  describe "poping a value from the stack" do

    it "should pop the last value from the stack" do
      stack = StackMachine::Stack.new
      stack.push 1
      stack.push 2

      tail = stack.last
      expect(stack.pop).to eq(tail)
      expect(stack).to eq [1]
    end

    it "should raise an error the stack is empty" do
      expect{stack.pop}.to raise_error StackMachine::Stack::UnderflowError
    end

  end

end
