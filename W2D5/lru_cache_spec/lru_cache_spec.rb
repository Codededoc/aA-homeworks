require 'rspec'
require 'lru_cache'

describe "LRUCache" do
  subject(:test) { LRUCache.new(4) }

  describe "#initialize" do
    expect(test.cache).to eq([])
  end

  describe "#add" do
    expect(test.add("A")).to eq(["A"])
  end

  describe "#count" do
    test.add("a")
    expect(test.count).to eq([1])
  end

  describe "#show" do
    test.add("a")
    expect(test.show).to eq(["a"])
  end

end
