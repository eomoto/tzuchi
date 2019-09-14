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

- install mysql

`brew install mysql`

- or upgrade mysql if you need to

`brew upgrade mysql`

- make sure that you start mysql

`brew services start mysql`

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

#### Developer Configurations (TODO)

#### Running the project

- run a development server

`rails s`, include `-p PORT_NUMBER` to specify a port

- open a console to interact with the project

`rails c`

## Services (TODO)

## Testing

- setup a test db

`rake db:create RAILS_ENV=test`

- migrate the test db

`rake db:migrate RAILS_ENV=test`

- run tests
`rails test`

## Deployment (TODO)
