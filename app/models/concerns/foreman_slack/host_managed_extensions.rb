module ForemanSlack
  module HostManagedExtensions
    extend ActiveSupport::Concern

    included do
      alias_method_chain :send_built_notification, :slack
    end

    private

    def send_built_notification_with_slack
      slack = ForemanSlack::SlackNotify.new
      slack.notify(_('%s has been built!') % name)
      send_built_notification_without_slack
    end
  end
end
