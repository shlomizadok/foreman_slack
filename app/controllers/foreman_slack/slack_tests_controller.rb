module ForemanSlack
  # Example: Plugin's HostsController inherits from Foreman's HostsController
  class SlackTestsController < ::ApplicationController
    # change layout if needed
    # layout 'foreman_slack/layouts/new_layout'

    def test_slack
      # automatically renders view/foreman_slack/hosts/new_action
      notify = ForemanSlack::SlackNotify.new
      notify.notify(_("Ahoy from Foreman !"))
    end
  end
end
