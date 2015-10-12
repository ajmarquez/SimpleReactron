require 'slack-ruby-client'

class Reactron

  attr_reader :token, :array, :url
  attr_writer :dummy

  def initialize(token="")
    @token = token
    @main_channel = ""
    @dummy = []
  end

  def track_reaction(array)
    @array = array
  end

  def compare
    @array.sort == @dummy.sort
  end

  def add_service(url)
  end

  def start
    Slack.configure do |config|
      fail 'Missing ENV[SLACK_API_TOKEN]!' unless @token
    end

    client = Slack::RealTime::Client.new

    client.on :message do |data|
      main_channel = data['channel'] if data['text']
    end

    client.on :reaction_added do |data|
      @dummy = []
      if main_channel!=0 then
        r_message = client.web_client.reactions_get(channel: main_channel, timestamp: data['item']['ts']) #(1)
        r_reactions = r_message['message']['reactions']

        r_reactions.each {|item| @dummy.push("#{item['name']}")}

        puts "THEY MATCH!" if Reactron.compare
        #Reactron.compare ? puts "THEY MATCH!" : puts "No match."

      end
    end



  end

end
