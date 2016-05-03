Rails.application.routes.draw do
  get 'slack_test', to: 'foreman_slack/slack_tests#test_slack'
end
