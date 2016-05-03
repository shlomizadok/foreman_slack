module ForemanSlack
  class Engine < ::Rails::Engine
    engine_name 'foreman_slack'

    config.autoload_paths += Dir["#{config.root}/app/models/concerns"]

    initializer 'foreman_discovery.load_default_settings', :before => :load_config_initializers do |app|
      require_dependency File.expand_path("../../../app/models/setting/slack.rb", __FILE__) if (Setting.table_exists? rescue(false))
    end

    initializer 'foreman_slack.register_plugin', :before => :finisher_hook do |_app|
      Foreman::Plugin.register :foreman_slack do
        requires_foreman '>= 1.4'

        # Add permissions
        security_block :foreman_slack do
          permission :test_foreman_slack, :'foreman_slack/slack_tests' => [:test_slack]
        end

        # Add a new role called 'Discovery' if it doesn't exist
        role 'ForemanSlack', [:test_foreman_slack]

        # add menu entry
        menu :admin_menu, :template,
             url_hash: { controller: :'foreman_slack/slack_tests', action: :test_slack },
             caption: 'Test Slack connection',
             parent: :administer_menu,
             after: :settings

        # add dashboard widget
        widget 'foreman_slack_widget', name: N_('Foreman plugin template widget'), sizex: 4, sizey: 1
      end
    end

    # Include concerns in this config.to_prepare block
    config.to_prepare do
      begin
        Host::Managed.send(:include, ForemanSlack::HostManagedExtensions)
      rescue => e
        Rails.logger.warn "ForemanSlack: skipping engine hook (#{e})"
      end
    end

    initializer 'foreman_slack.register_gettext', after: :load_config_initializers do |_app|
      locale_dir = File.join(File.expand_path('../../..', __FILE__), 'locale')
      locale_domain = 'foreman_slack'
      Foreman::Gettext::Support.add_text_domain locale_domain, locale_dir
    end
  end
end
