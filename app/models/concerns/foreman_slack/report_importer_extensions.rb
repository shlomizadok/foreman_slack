module ForemanSlack
  module ReportImporterExtensions
    extend ActiveSupport::Concern

    included do
      alias_method_chain :notify_on_report_error, :slack
    end

    private

    def notify_on_report_error_with_slack
      if Setting[:notify_slack_puppet_error] && report.error?
        slack = ForemanSlack::SlackNotify.new
        slack.notify(_('%s is in error state. Please check logs') % name)
      end
      notify_on_report_error_without_slack
    end
  end
end