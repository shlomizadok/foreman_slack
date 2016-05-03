class Setting::Slack < ::Setting

  BLANK_HOOK = 'blank_hook'
  def self.load_defaults
    Setting.transaction do
      [
        self.set('slack_webhook', N_("Slack.com webhook URL"), BLANK_HOOK),
        self.set('slack_channel', N_("Slack channel (starts with #)"), "#dev_ops"),
        self.set('slack_username', N_("User name"), "foreman"),
      ].compact.each { |s| self.create s.update(:category => "Setting::Slack")}
    end
  end
end