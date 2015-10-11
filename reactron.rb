require 'slack-ruby-client'

class Reactron

  attr_reader :token, :array, :url

  def initialize(token)
    @token = token
    @main_channel = ""
  end

  def track_reaction(array)
    @array = array
  end

  def add_service(url)
  end

  def start

    Slack.configure do |config|
      config.token = @token
      fail 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
    end

    client = Slack::RealTime::Client.new
    main_array = @array

    if data['text']
        main_channel = data['channel']
      end
    end


  end

end
