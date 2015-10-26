require 'spec_helper'


describe Reactron do

  before :example do
    @reactron = Reactron.new('XXXXXXX')
  end

  describe "#New" do

    it "Takes an Slack Token" do
      expect(@reactron.token).to eql('XXXXXXX')
    end

  end

  describe ".track_reaction" do

    it "Takes an array of reactions" do
      @reactron.track_reaction(['+1','imp'])
      expect(@reactron.array).to be_an Array
    end

  end

  describe ".is_tracked" do

    it "Notifies if there's a matched reaction" do
      @reactron.track_reaction(['+1','imp','smile'])
      @reactron.dummy = ['+1']
      expect(@reactron.is_tracked?).to be_truthy

    end

  end

  describe ".add_service" do

    it "Takes an URL to execute a service"

  end

  describe ".start" do

    it "Notifies if token available" do

      expect(@reactron.token).to be_truthy

    end

    it "Notifies if token not available" do
      @reactronNil = Reactron.new
      expect(@reactronNil.token.length > 0).to be_falsey

    end

  end

end
