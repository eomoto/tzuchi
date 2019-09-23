# tzuchi

- website for Tzu Chi Bohol

## Setup

#### Prerequisites

- make sure you have xcode tools installed

`xcode-select --install`

- install gpg

`brew install gpg`

- install the security key for rvm

`command curl -sSL https://rvm.io/mpapis.asc | gpg --import -`

- install rvm

`\curl -L https://get.rvm.io | bash -s stable`

- install ruby version

`rvm install 2.6.4`

- set rvm to use 2.6.4 by default (optional)

`rvm use --default 2.6.4`

- install postgres

`brew install postgres`

- or upgrade postgres if you need to

`brew upgrade postgres`

- make sure that you start postgres

`brew services start postgres`

- install webpacker

`rails webpacker:install`

- install action text

`rails action_text:install`

- install foreman

`gem install foreman`

- install bootstrap

`yarn add bootstrap@4.3.1 jquery popper.js`

#### Installing Project

- clone repo

`git clone THIS_REPO`

- install bundler

`gem install bundler`

- install gems

`bundle install`

- create your db

`rake db:create`

- migrate your db

`rake db:migrate`

#### Developer Configurations

- setup a new admin user
`rake admin:create`

#### Running the project

- run a development server at localhost:PORT_NUMBER

`rails s`, include `-p PORT_NUMBER` to specify a port

- run foreman

`foreman start -f Procfile.dev`

- open a console to interact with the project

`rails c`

## Testing

- setup a test db & migrate if you don't already have one setup

`rake db:create RAILS_ENV=test`

`rake db:migrate RAILS_ENV=test`

- run tests
`rails test`

## Deployment (TODO)

## Notes

- add new stylesheets in `app/javascript/stylesheets` and link them in `app/javascript/stylesheets/application.scss`
- add new js in `app/javascript/packs` and link them in `app/javascript/packs/application.js`
