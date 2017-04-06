require_relative "card"

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def shuffle
    @cards = cards.shuffle
  end

  def deal_card(n)
    dealt_cards = []
    n.times { dealt_cards << @cards.pop }
    dealt_cards
  end

  def deal_hand
    deal_card(5)
  end

  private

  def self.generate_deck
    suits = %w{Hearts Clubs Spades Diamonds}
    card_values = { "2" => 2, "3" => 3, "4" => 4,
                    "5" => 5, "6" => 6, "7" => 7,
                    "8" => 8, "9" => 9, "10" => 10,
                    "J" => 11, "Q" => 12, "K" => 13, "A" => 14}
    cards = []
    suits.each do |suit|
      card_values.each do |card, value|
        cards << Card.new(suit, value, card)
      end
    end
    Deck.new(cards)
  end
end
