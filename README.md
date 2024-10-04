This application exists to help diagnose [a potential bug in `cypress-rails 0.8.0.rc1`](https://github.com/testdouble/cypress-rails/issues/164#issuecomment-2375449736).

## Setup

First, you'll need Ruby and Node. This app calls for 3.3.5 and 22.9.0 but anything close to that should work. You'll also need PostgreSQL running locally. If your local install of Postgres requires a password to log in, you'll want to set a proper username and password in `config/database.yml`.

1. Install deps with `bundle` and `npm install`
1. Set up the database with `bin/rails db:test:prepare`
1. Run `bin/rails cypress:run`. The second test _should_ fail, but it might take a few runs of `bin/rails cypress:run`. This test failure means that the database is not getting properly reset between tests.
1. Alternatively, you can run Cypress in interactive mode with `bin/rails cypress:open` so observe the issue with the database not getting reset between tests or runs of the test suite.
