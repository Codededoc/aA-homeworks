require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Darren") }
  let(:tart) {Dessert.new("tart", 10, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(tart.type).to eq("tart")
    end

    it "sets a quantity" do
      expect(tart.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(tart.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("custard", "lots", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(tart.add_ingredient("egg")).to include("egg")
      # should be tart.add_ingredient("egg")
      # expect(tart.ingredients).to include("egg")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["egg", "flour", "sugar", "milk"]

      ingredients.each do |ingredient|
        tart.add_ingredient(ingredient)
      end
      #expect(tart.ingredients).to eq(ingrdients)
      tart.mix!

      expect(tart.ingredients).not_to eq(ingredients)
      expect(tart.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      tart.eat(2)
      expect(tart.quantity).to eq(8)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { tart.eat(12) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Darren the Great Baker")
      expect(tart.serve).to eq("Chef Darren the Great Baker has made 10 tarts!")
      # expect(tart.serve).to include("Chef Darren the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      # tart.make_more
      expect(chef).to receive(:bake).with(tart)
      tart.make_more
    end

  end
end
