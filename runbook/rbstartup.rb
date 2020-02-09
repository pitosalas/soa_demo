#!/usr/bin/env ruby
require "runbook"
require_relative "rbenv"

runbook = Runbook.book "Startup" do
  section "Run Primary" do
    step "run" do
      env({TWITTER_CONSUMER_KEY: TWTITER_CONSUMER_KEY,
           TWITTER_CONSUMER_SECRET: TWITTER_CONSUMER_SECRET,
           TWITTER_ACCESS_TOKEN: TWITTER_ACCESS_TOKEN,
           TWITTER_ACCESS_SECRET: TWITTER_ACCESS_SECRET})
      server "rails@" + PRIMARY_SERVER_IP
      command "pwd"
      command "/usr/bin/ruby soa_demo/soa_publisher_node.rb;"
    end
  end
end

if __FILE__ == $0
  Runbook::Runner.new(runbook).run(start_at: 1, auto: true)
else
  runbook
end
run
