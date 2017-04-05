require 'rspec'
require 'towers_of_hanoi'

describe TowersOfHanoi do
  subject(:game1) { TowersOfHanoi.new }
  subject(:board) {[[1,2,3], [], []]}
  describe "#initialize" do
    it "has a variable representing board" do
      expect(game1.boad).to eq(board)
    end
  end

  describe "#move" do
    subject(:game_start) { [[1,2,3], [], []]}
    it "moves the top disc to different pile" do
      expect(towers_of_hanoi.)
    end


  end
end
