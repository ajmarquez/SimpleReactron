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

  describe "track_reaction" do

    it "Takes an array of reactions" do
      @reactron.track_reaction(['+1','imp'])
      expect(@reactron.array).to be_an Array
    end

  end

  xdescribe "add_service" do

    it "Takes an URL to execute a service"

  end

  describe "start" do

    it "Notifies if auth works" do

      expect(config.token).to be_truthy

    end

    it "Notifies if an error occurs"

    it "Notifies if there's a match"

  end

end
