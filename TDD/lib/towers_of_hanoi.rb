class TowersOfHanoi
  attr_accessor :board

  def initialize
    @board = [[1, 2, 3], [], []]
  end

  def move(from, to)
    if valid_move?(from, to)
      board[to].unshift(board[from].shift)
    else
      raise "Invalid move"
    end
  end

  def valid_move?(from, to)
    ((0..2).include?(from) && (0..2).include?(to)) && !board[from].empty? &&
    (board[to].empty? || (board[to].first > board[from].first))
  end

  def won?
    board[2].length == 3
  end
end
