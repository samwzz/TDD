require 'rspec'
require 'deck'

describe Deck do
  subject(:empty_deck) { Deck.new([]) }

  describe "#initialize" do
    it "sets deck to array of cards" do
      expect(empty_deck.cards).to eq([])
    end
  end

  subject(:real_deck) { Deck.generate_deck }

  describe "::generate_deck" do
    it "creates a new instance of deck with 52 cards" do
      expect(real_deck.cards.length).to eq(52)
    end

    it "creates 52 unique cards" do
      expect(real_deck.cards.uniq.length).to eq(52)
    end
  end

  describe "#shuffle" do
    it "shuffles the deck" do
      cards = real_deck.cards.dup
      real_deck.shuffle
      expect(real_deck.cards).to_not eq(cards)
    end
  end

  describe "#deal_card" do
    it "deals the top n cards from the deck" do
      real_deck.deal_card(1)
      expect(real_deck.cards.length).to eq(51)
    end

    it "returns an array of cards dealt" do
      expect(real_deck.deal_card(2)).to be_a_instance_of(Array)
    end
  end

  describe "#deal_hand" do
    it "deals five cards from the deck" do
      expect(real_deck).to receive(:deal_card).with(5)
      real_deck.deal_hand
    end
  end
end
