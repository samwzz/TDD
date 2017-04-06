require 'rspec'
require 'hand'

describe Hand do
  subject(:straight_flush) { Hand.new([card1, card2, card3, card4, card5]) }
  subject(:four_of_a_kind) { Hand.new([card5, card6, card7, card8, card1]) }
  subject(:three_of_a_kind) { Hand.new([card5, card6, card7, card2, card1]) }
  subject(:two_pair) { Hand.new([card6, card7, card4, card9, card1]) }
  subject(:one_pair) { Hand.new([card3, card6, card7, card2, card1]) }
  subject(:full_house) { Hand.new([card5, card6, card7, card4, card9])}
  
  let(:card1) { double("card1", :suit => "Hearts", :value => 2)}
  let(:card2) { double("card2", :suit => "Hearts", :value => 3)}
  let(:card3) { double("card3", :suit => "Hearts", :value => 4)}
  let(:card4) { double("card4", :suit => "Hearts", :value => 5)}
  let(:card5) { double("card5", :suit => "Hearts", :value => 6)}

  let(:card6) { double("card6", :suit => "Diamonds", :value => 6)}
  let(:card7) { double("card7", :suit => "Spades", :value => 6)}
  let(:card8) { double("card8", :suit => "Clubs", :value => 6)}
  let(:card9) { double("card9", :suit => "Clubs", :value => 5)}


  describe "#initialize" do
    it "sets hand to an array" do
      expect(straight_flush.cards).to be_a_instance_of(Array)
    end

    it "sets hand to an array of length 5" do
      expect(straight_flush.cards.length).to eq(5)
    end
  end

  describe "::flush?" do
    it "returns true if hand is a flush" do
      expect(Hand.flush?(straight_flush)).to be_truthy
    end
  end

  describe "::straight?" do
    it "returns true if hand is a straight" do
      expect(Hand.straight?(straight_flush)).to be_truthy
    end
  end

  describe "::straight_flush?" do
    it "returns true if hand is a straight flush" do
      expect(Hand.straight_flush?(straight_flush)).to be_truthy
    end
  end

  describe "::four_of_a_kind?" do
    it "returns true if hand is four of a kind" do
      expect(Hand.four_of_a_kind?(four_of_a_kind)).to be_truthy
    end
  end

  describe "::three_of_a_kind?" do
    it "returns true if hand is three of a kind" do
      expect(Hand.three_of_a_kind?(three_of_a_kind)).to be_truthy
    end
  end

  describe "::n_pair" do
    it "returns the number of pairs" do
      expect(Hand.n_pair(two_pair)).to eq(2)
    end
  end

  describe "::one_pair?" do
    it "returns true if hand is one pair" do
      expect(Hand.one_pair?(one_pair)).to be_truthy
    end

    it "returns false if hand is two pair" do
      expect(Hand.one_pair?(two_pair)).to be_falsey
    end
  end

  describe "::two_pair?" do
    it "returns true if hand is one pair" do
      expect(Hand.two_pair?(two_pair)).to be_truthy
    end

    it "returns false if hand is two pair" do
      expect(Hand.two_pair?(one_pair)).to be_falsey
    end
  end

  describe "::high_card" do
    it "returns the value of the highest card in the hand" do
      expect(Hand.high_card(straight_flush)).to eq(6)
    end
  end

  describe "::full_house?" do
    it "returns true if hand has one pair and three of a kind" do
      expect(Hand.high_card(full_house)).to be_truthy
    end
  end
end
