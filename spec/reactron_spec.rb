require 'spec_helper'

describe ReactionTracker do

  before :each do
    @reaction_list = ReactionTracker.new [':imp:',':+1:']
  end

  describe "#new" do
    it "creates an array of reactions" do
      expect(@reaction_list).to be_instance_of ReactionTracker
    end

    it "Should not be allowed" do
      expect(lambda{ReactionTracker.new("array", "array2")}).to raise_exception ArgumentError
    end
  end



end
