class Setting::Slack < ::Setting

  BLANK_HOOK = 'blank_hook'
  def self.load_defaults
    Setting.transaction do
      [
        self.set('slack_webhook', N_("Slack.com webhook URL"), BLANK_HOOK),
        self.set('slack_channel', N_("Slack channel (starts with #)"), "#dev_ops"),
        self.set('slack_username', N_("User name"), "foreman"),
        self.set('notify_slack_host_built', N_("Notify Slack when host is build"), true, N_("Notify Slack Host build")),
        self.set('notify_slack_puppet_error', N_("Notify Slack on puppet error"), true, N_("Notify Slack Puppet error")),
      ].compact.each { |s| self.create s.update(:category => "Setting::Slack")}
    end
  end
end