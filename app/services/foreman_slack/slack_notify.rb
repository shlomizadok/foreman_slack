require 'slack-notifier'
module ForemanSlack
  class SlackNotify
    def initialize
      @webhook = Setting[:slack_webhook]
      @channel = Setting[:slack_channel] || '#general' #each Slack team has a general channel
      @username = Setting[:slack_username] || 'foreman'
      @notifier = ::Slack::Notifier.new(@webhook, :channel => @channel, :username => @username) if valid_webhook?
    end

    def notify(message)
      @notifier.ping(message) if @notifier
    end

    private

    def valid_webhook?
      true if @webhook && @webhook != 'blank_hook'
    end
  end
end
