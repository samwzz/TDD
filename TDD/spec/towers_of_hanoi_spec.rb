require 'rspec'
require 'towers_of_hanoi'

describe TowersOfHanoi do
  subject(:game1) { TowersOfHanoi.new }
  subject(:board) { [[1, 2, 3], [], []] }
  describe "#initialize" do
    it "has a variable representing board" do
      expect(game1.board).to eq(board)
    end
  end

  describe "#move" do
    it "raises ArgumentError if no indices are passed" do
      expect { game1.move }.to raise_error(ArgumentError)
    end

    it "raises error if invalid move" do
      game1.board = [[2, 3], [1], []]
      expect { game1.move(0, 1) }.to raise_error("Invalid move")
    end

    it "successfully moves a disc" do
      game1.move(0, 1)
      expect(game1.board).to eq([[2, 3], [1], []])
    end
  end

  describe "#valid_move?" do
    it "returns false if move is out of range" do
      expect(game1.valid_move?(0, 3)).to be_falsey
    end

    it "returns true if move is valid" do
      expect(game1.valid_move?(0, 2)).to be_truthy
    end

    it "returns false if from stack is empty" do
      game1.board = [[2, 3], [1], []]
      expect(game1.valid_move?(2, 1)).to be_falsey
    end

    it "returns false if illegal move" do
      game1.board = [[2, 3], [1], []]
      expect(game1.valid_move?(0, 1)).to be_falsey
    end
  end

  describe "#won?" do
    subject(:winning) { [[], [], [1, 2, 3]] }
    before(:each) { game1.board = [[], [1], [2, 3]] }

    it "returns true if game is won" do
      game1.move(1,2)
      expect(game1.board).to eq(winning)
    end

    it "returns false if game is not over" do
      expect(game1.won?).to be_falsey
    end
  end
end
