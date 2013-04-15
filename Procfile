w1: bundle exec rake test:work $RAILS_ENV
w2: bundle exec rake test:work $RACK_ENV
w3: bundle exec rake test:work $TESTER
custom_web: bundle exec unicorn_rails -c config/unicorn.rb -E $RAILS_ENV -D