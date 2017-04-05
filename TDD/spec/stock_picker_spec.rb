require 'rspec'
require 'stock_picker'

describe "#stock_picker" do
  subject(:array) {[45, 52, 74, 22, 45, 44]}

  it "returns an array" do
    expect(stock_picker(array)).to be_an_instance_of(Array)
  end

  it "returns an array of two days" do
    expect(stock_picker(array).length).to eq(2)
  end

  it "returns the most profitable pair of days" do
    expect(stock_picker(array)).to eq([1, 3])
  end
end
