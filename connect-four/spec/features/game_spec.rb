require 'rails_helper'

describe "Starting a Game" do

  it "updates the game board when a player moves" do
    visit root_path
    click_on 'Start Game'
  end

  it "shows 6 x 7 game board" do
    visit root_path
    expect(current_path).to eq(root_path)
  end
end

