require 'rubygems'
require 'bundler/setup'
require 'slack-ruby-client'
require_relative 'tracker'



## First we configure the Slack client and feed the Token
Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
  fail 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
end

client = Slack::RealTime::Client.new
main_array = ReactionTracker.new ['imp','+1']
main_channel = ""

client.on :message do |data|

  if data['text'] then
    main_channel = data['channel']
  end

end



client.on :reaction_added do |data|

  dummy_list = []

  if main_channel!=0 then

    r_message = client.web_client.reactions_get(channel: main_channel, timestamp: data['item']['ts']) #(1)
    r_reactions = r_message['message']['reactions'] #Reactions from reacted message

    r_reactions.each do |item|
      dummy_list.push("#{item['name']}") #(2)
    end

    if main_array.matched(dummy_list) then   #(3) and (4)
      puts "THEY MATCH!"
      client.message channel: main_channel, text: "And it's a match! "
    else
      puts "No match."
    end
  end
end


#To execute copy and paste this
# SLACK_API_TOKEN=xoxb-10237477606-qCNwWBSnmWiIvoVcWzPxorXm  bundle exec ruby reactron.rb


client.start!
