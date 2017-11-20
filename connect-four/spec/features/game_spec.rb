require 'rails_helper'

describe "Starting a Game" do

  it "goes to the root path" do
    visit root_path
    expect(current_path).to eq(root_path)
  end
end

