module ForemanSlack
  # Example: Plugin's HostsController inherits from Foreman's HostsController
  class HostsController < ::HostsController
    # change layout if needed
    # layout 'foreman_slack/layouts/new_layout'

    def new_action
      # automatically renders view/foreman_slack/hosts/new_action
      notify = ForemanSlack::SlackNotify.new
      notify.notify("Ahoy !!")
    end
  end
end
