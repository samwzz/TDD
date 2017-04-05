class Array
  def my_uniq
    uniq = []
    each do |el|
      uniq << el unless uniq.include?(el)
    end
    uniq
  end

  def two_sum
    pairs = []
    (0..self.length - 2).each do |i|
      (i+1..self.length - 1).each do |j|
        pairs << [i, j] if self[i] + self[j] == 0
      end
    end
    pairs
  end

  def my_transpose
    transposed = Array.new(self.length) { [] }
    each_index do |i|
      self.length.times do |j|
        transposed[i] << self[j][i]
      end
    end
    transposed
  end

end
