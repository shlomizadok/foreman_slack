module ForemanSlack
  module HostManagedExtensions
    extend ActiveSupport::Concern

    included do
      alias_method_chain :send_built_notification, :slack
    end

    private

    def send_built_notification_with_slack
      if Setting[:notify_slack_host_built]
        slack = ForemanSlack::SlackNotify.new
        slack.notify(_('%s has been built!') % name)
      end
      send_built_notification_without_slack
    end
  end
end
