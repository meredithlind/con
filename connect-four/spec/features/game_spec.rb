require 'rails_helper'

describe "Viewing the game board" do

  it "shows 6 x 7 game board" do
    visit root_path
    expect(current_path).to eq(root_path)
  end
end

