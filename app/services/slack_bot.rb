class SlackBot

  def initialize(channel)
    @uri = URI("https://slack.com/api/chat.postMessage")
    @token = ENV['SLACK_BOT_TOKEN']
    @channel = channel
  end

  def message(msg)
    @params = {
                token: @token,
                channel: @channel,
              	text: msg
              }
    self
  end

  def deliver
    begin
      Net::HTTP.post_form(@uri, @params)
    rescue => e
      Rails.logger.error("SlackBot: Error when sending: #{e.message}")
    end
  end

end
