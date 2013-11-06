
require 'spec_helper'



describe StackMachine do

  let(:machine) { StackMachine.new }

  let(:stack) { machine.stack }


  describe "#stack_machine_emulator" do

    it "should push the values to the stack" do
      machine.stack_machine_emulator("1")
      expect(stack).to eq([1])
      machine.stack_machine_emulator("2")
      expect(stack).to eq([1,2])
    end

    it "should return -1 if the string has invalid input" do
      expect(machine.stack_machine_emulator("a")).to eq(-1)
    end

    it "should add the values" do
      expect(machine.stack_machine_emulator("13+")).to eq(4)
    end

    it "should multiply the values" do
      expect(machine.stack_machine_emulator("13*")).to eq(3)
    end

    it "shold return 76 for 13+62*7+*" do
      expect(machine.stack_machine_emulator("13+62*7+*")).to eq(76)
    end

    it "should return -1 if there are not enought bits into the stack" do
      expect(machine.stack_machine_emulator("11++")).to eq(-1)
    end

  end



end
