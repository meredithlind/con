require 'rails_helper'

RSpec.describe Cell, type: :model do

  context "#initialize" do
    it "has a default value of 0" do
      cell = Cell.new
      expect(cell.value).to eq(0)
    end

    it "can be created with a value of 1" do
      cell = Cell.new(1)
      expect(cell.value).to eq(1)
    end
  end
end
