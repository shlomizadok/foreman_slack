Rails.application.routes.draw do
  get 'new_action', to: 'foreman_slack/hosts#new_action'
end
