# Core Staffing's IVR Phone Tree

## Deploy to Heroku

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/TwilioDevEd/ivr-phone-tree-rails)

## Local Development

This project is built using [Ruby on Rails](http://rubyonrails.org/) Framework.

To run this locally on your machine.

1. First clone this repository and `cd` into it.

   ```bash
   $ git clone git@github.com:TwilioDevEd/ivr-phone-tree-rails.git
   $ cd ivr-phone-tree-rails
   ```

1. Install the dependencies.

   ```bash
   $ bundle install
   ```

1. Make sure the tests succeed.

   ```bash
   $ rake test
   ```

1. Start the server.

   ```bash
   $ bundle exec rails s
   ```

1. Check it out at [http://localhost:3000](http://localhost:3000).

## How to Demo

1. Expose the application to the wider Internet using [ngrok](https://ngrok.com/).

   ```bash
   $ ngrok http 3000
   ```
   
1. Provision a number under the
   [Manage Numbers page](https://www.twilio.com/user/account/phone-numbers/incoming)
   on your account. Set the voice URL for the number to
   `http://<your-ngrok-subdomain>.ngrok.io/ivr/welcome`.

1. Grab your phone and call your newly-provisioned number!

## Meta

* No warranty expressed or implied. Software is as is. Diggity.
* [MIT License](http://www.opensource.org/licenses/mit-license.html)
* Thanks Twilio Developer Education.
