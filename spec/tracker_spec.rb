require 'spec_helper'

describe ReactionTracker do

  before :example do
    @reaction_list = ReactionTracker.new ['imp','+1']

  end

  describe "#new" do

    it "Creates an array of reactions" do
      expect(@reaction_list.array).to be_an Array
    end

    it "Should not be allowed" do
      expect(lambda{ReactionTracker.new("array", "array2")}).to raise_exception ArgumentError
    end
  end

  describe ".matched" do

    describe "Takes the ReactionTracker array and compares it with another" do

      it "Returns true when arrays match" do
        @dummyArray = ['imp','+1']
        expect(@reaction_list.matched(@dummyArray)).to be_truthy

      end

      it "Returns false when arrays don't match" do
        @dummyArray = ['imp']
        expect(@reaction_list.matched(@dummyArray)).to be_falsey
      end
    end
  end

end
