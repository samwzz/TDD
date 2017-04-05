require 'first_tdd'
require 'rspec'

describe Array do
  describe "#my_uniq" do
    subject(:array) {[1,1,2,3,3]}

    it "returns an array" do
      expect(array.my_uniq).to be_an(Array)
    end

    it "removes duplicate values from the array" do
      expect(array.my_uniq).to eq([1,2,3])
    end
  end

  describe "#two_sum" do
    subject(:array) {[-1,0,2,-2,1]}
    subject(:array2) { [1,1,2,3,3] }

    it "returns an array" do
      expect(array.two_sum).to be_an_instance_of(Array)
    end

    it "returns an empty array when no sums are found" do
      expect(array2.two_sum).to be_empty
    end

    it "returns a two dimensional array when sums are found" do
      result = array.two_sum
      expect(result[0]).to be_an_instance_of(Array)
    end

    it "returns the correct indices" do
      expect(array.two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#my_transpose" do
    subject(:array) {[
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
    ]}

    subject(:transposed) {[
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
    ]}

    it "returns an array" do
      expect(array.my_transpose).to be_an_instance_of(Array)
    end

    it "returns an array of the same length" do
      expect(array.my_transpose.length).to eq(array.length)
    end

    it "transposes array" do
      expect(array.my_transpose).to eq(transposed)
    end
  end
end
