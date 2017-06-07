require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:cake) {Dessert.new("cake", 50, chef)}
  let(:chef) { double("chef", name: "Bob") }


  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(cake.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "string", "bob") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cake.add_ingredient("eggs")
      expect(cake.ingredients).to eq(["eggs"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array"do
      ingredients = ["eggs","flour","water","sugar"]
      ingredients.each do |ingredient|
        cake.add_ingredient(ingredient)
      end
      expect(cake.mix!).to_not eq(ingredients)
      expect(cake.ingredients.length).to eq(ingredients.length)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cake.eat(5)
      expect(cake.quantity).to eq(45)
    end
    it "raises an error if the amount is greater than the quantity" do
      expect{cake.eat(500)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Bob the Great Baker")
      expect(cake.serve).to eq("Chef Bob the Great Baker has made 50 cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cake)
      cake.make_more
    end
  end
end
