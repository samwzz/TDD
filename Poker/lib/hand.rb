require 'card'
require 'deck'

class Hand
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def self.compare_hands(*hands)
    hand_values = {}
    hands.each do |hand|
      case hand
      when self.straight_flush?(hand)
        hand_values[hand] = 22
        break
      when self.four_of_a_kind?(hand)
        hand_values[hand] = 21
        break
      when self.full_house?(hand)
        hand_values[hand] = 20
        break
      when self.flush?(hand)
        hand_values[hand] = 19
        break
      when self.straight?(hand)
        hand_values[hand] = 18
        break
      when self.three_of_a_kind?(hand)
        hand_values[hand] = 17
        break
      when self.two_pair?(hand)
        hand_values[hand] = 16
        break
      when self.one_pair?(hand)
        hand_values[hand] = 15
        break
      when self.high_card(hand)
        hand_values[hand] = self.high_card(hand)
        break
      end
    end

    highest_hand = hand_values.max_by{|k,v| v}.key
    highest_value = hand_value[highest_hand]

    if hand_values.count {|hand, value| value == highest_value } == 1
      return highest_hand
    else
      tied_hands = hand_values.select {|_,v| v == highest_value}
    end
  end

  def self.flush?(hand)
    suit = hand.cards[0].suit
    return suit if hand.cards.all? { |card| card.suit == suit }
    false
  end

  def self.straight?(hand)
    range = []
    hand.cards.each do |card|
      range << card.value
    end
    range.sort!
    (range.min..range.max).to_a == range
  end

  def self.straight_flush?(hand)
    self.flush?(hand) && self.straight?(hand)
  end

  def self.four_of_a_kind?(hand)
    value_count = Hash.new(0)
    hand.cards.each do |card|
      value_count[card.value] += 1
    end
    value_count.any? { |_, v| v == 4 }
  end

  def self.full_house(hand)
    self.three_of_a_kind(hand) && self.one_pair(hand)
  end

  def self.three_of_a_kind?(hand)
    value_count = Hash.new(0)
    hand.cards.each do |card|
      value_count[card.value] += 1
    end
    value_count.any? { |_, v| v == 3 }
  end

  def self.n_pair(hand)
    value_count = Hash.new(0)
    hand.cards.each do |card|
      value_count[card.value] += 1
    end
    value_count.count { |_, v| v == 2 }
  end

  def self.two_pair?(hand)
    self.n_pair(hand) == 2
  end

  def self.one_pair?(hand)
    self.n_pair(hand) == 1
  end

  def self.high_card(hand)
    hand.cards.sort_by { |card| card.value }.last.value
  end


end
