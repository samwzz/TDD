class Card
  attr_reader :suit, :value
  def initialize(suit, value, name)
    @suit = suit
    @value = value
    @name = name
  end
end
