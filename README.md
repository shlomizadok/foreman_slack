# Foreman Slack
**WIP**
A plugin with sends events from Foreman to a Slack channel.
It currently sends only "host is built" event. More is planned.

## Installation

Foreman Slack can be installed only as a gem.
See [How to install a Plugin](https://theforeman.org/plugins/#2.3AdvancedInstallationfromGems) for how to install on Foreman.

### SLACK WEBHOOK_URL
To get WEBHOOK_URL you need:
    
1. Go to https://slack.com/apps/A0F7XDUAZ-incoming-webhooks
2. Choose your team, press configure
3. In configurations press add configuration
4. Choose channel, press "Add Incoming WebHooks integration"

## Usage

Once you've got a Slack Webhook URL, you can add it in /settings, under the Slack tab.

## TODO

- [x] Add 'Puppet error state' event
- [ ] Add tests

## Contributing

Fork and send a Pull Request. Thanks!

## Copyright

Copyright (c) *2016* *Shlomi Zadok*

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

