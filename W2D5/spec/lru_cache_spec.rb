require 'rspec'
require 'lru_cache'

describe "LRUCache" do
  subject(:test) { LRUCache.new(4) }

  describe "#initialize" do
    it "initializes cache to an empty array" do
      expect(test.cache).to eq([])
    end
  end

  describe "#add" do
    it "adds element to cache" do
      expect(test.add("A")).to eq(["A"])
    end
  end

  describe "#count" do
    it "counts the number of elements in the cache" do
      test.add("a")
      expect(test.count).to eq(1)
    end
  end

  describe "#show" do
    it "shows the cache" do
      test.add("a")
      expect(test.show).to eq(["a"])
    end
  end

end
