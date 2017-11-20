class Player < ApplicationRecord
  attr_reader :value, :name

  def initialize(input)
    super
    @value = input.fetch(:value)
    @name = input.fetch(:name)
  end
end
