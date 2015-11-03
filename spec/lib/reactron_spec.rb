require 'spec_helper'


describe Reactron do

  #before :example do
  #  @reactron = Reactron.new('XXXXXXX')
  #end

  describe "#New" do

    it "Requires a Slack token to authorize access to your team" do
      expect(Reactron.new('XXXXXXX')).to be_truthy
    end

  end

  describe ".track_reaction" do

    it "inserts the reactions to be tracked to an Array" do
      @reactron = Reactron.new
      @reactron.track_reaction(['+1','imp'])
      expect(@reactron.array).to be_an Array
    end

  end

  describe ".is_tracked" do

    it "shows if the last posted reaction is included inside the tracked reactions array " do
      @reactron = Reactron.new
      @reactron.track_reaction(['+1','imp','smile'])
      @reactron.dummy = ['+1']
      expect(@reactron.is_tracked?).to be_truthy

    end

  end

  describe ".add_service" do

    it "takes an URL for the service to be called when a tracked reaction is posted"

  end

  describe ".start" do

    it "displays TRUE if a token is available" do
      @reactron = Reactron.new('XXXX')
      expect(@reactron.token).to be_truthy

    end

    it "displays TRUE if a token is NOT available" do
      @reactronNil = Reactron.new
      expect(@reactronNil.token.length > 0).to be_falsey

    end

  end

end
