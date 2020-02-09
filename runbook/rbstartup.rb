#!/usr/bin/env ruby
require "runbook"
require_relative "rbenv"

runbook = Runbook.book "Startup" do
  env({TWITTER_CONSUMER_KEY: TWTITER_CONSUMER_KEY})
  env({TWITTER_CONSUMER_SECRET: TWITTER_CONSUMER_SECRET})
  env({TWITTER_ACCESS_TOKEN: TWITTER_ACCESS_TOKEN})
  env({TWITTER_ACCESS_TOKEN_SECRET: TWITTER_ACCESS_TOKEN_SECRET})


  section "Run Primary" do
    step "run" do
      server "rails@" + PRIMARY_SERVER_IP
      command "pwd"
      command "cd soa_demo; /usr/bin/ruby soa_publisher_node.rb", raw: true
    end
  end
end

if __FILE__ == $0
  Runbook::Runner.new(runbook).run(start_at: 1, auto: true)
else
  runbook
end
