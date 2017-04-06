require 'rspec'
require 'card'

describe Card do
  subject(:card) { Card.new('Hearts', 'Ace', 14)}
  describe "#initialize" do
    it "sets suit" do
      expect(card.suit).to eq('Hearts')
    end

    it "sets value" do
      expect(card.value).to eq("Ace")
    end
  end


end
