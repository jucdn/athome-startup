# At Home Startup

At Home Startup is an open source toolkit to engage Startups community & coworking spaces.

# Features
- Book shared rooms
- People & contacts
- Startups/Company details

## Release History

* 0.1.0
    * First release

## License

Julien Chardon – [@ju_cdn](https://twitter.com/ju_cdn)

Distributed under the MIT license. See ``LICENSE`` for more information.

## Developping

Rough steps to setup a development environment:
```
sudo apt install ruby-2.5
sudo gem install bundler
bundle install

sudo apt install postgresql libpq-dev
# Manually configure postgresql to accept postgres:postgres as credentials:
#   sudo -u postgres psql
#   vim /etc/postgresql/10/main/pg_hba.conf

rake db:setup

# Create a slack app: https://api.slack.com/apps
# (you can create the app without being an administrator of the Slack workspace)
# Add this oauth redirect uri: http://localhost:3000/users/auth/slack/callback

SLACK_APP_ID=<client_id_of_slack_app> SLACK_APP_SECRET=<client_secret_of_slack_app> rails server
# SLACK_TEAM_ID is optional
```

## Contributing

1. Fork it (<https://github.com/jucdn/athome-startup/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request
