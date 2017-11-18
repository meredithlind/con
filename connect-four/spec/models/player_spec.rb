require 'spec_helper'

RSpec.describe Player, type: :model do
  context "#initialize" do

    it "raises an exception when initialized with {}" do
      expect { Player.new({}) }.to raise_error
    end

    it "does not raise an error when initialized with a valid input hash" do
        input = { value: 1, name: "Player 1" }
          expect { Player.new(input) }.to_not raise_error
    end
  end

  context "#value" do
    it "returns the player's value" do
      input = { value: 1, name: "Player 1" }
      player = Player.new(input)
      expect(player.value).to eq 1
    end
  end

  context "#name" do
    it "returns the player's name" do
      input = { value: 1, name: "Player 1" }
      player = Player.new(input)
      expect(player.name).to eq "Player 1"
    end
  end
end
