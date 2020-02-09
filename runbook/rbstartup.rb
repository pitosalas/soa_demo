#!/usr/bin/env ruby
require "runbook"
require_relative "rbenv"

runbook = Runbook.book "Startup" do
  layout [[
    {:left => 20, {name: :middle, runbook_pane: true} => 60, :right => 20},
    {bottom_left: 5, bottom_right: 5}
  ]]
  section "Run Primary" do
    step "run" do
      env({TWITTER_CONSUMER_KEY: TWTITER_CONSUMER_KEY,
           TWITTER_CONSUMER_SECRET: TWITTER_CONSUMER_SECRET,
           TWITTER_ACCESS_TOKEN: TWITTER_ACCESS_TOKEN,
           TWITTER_ACCESS_SECRET: TWITTER_ACCESS_SECRET})
      server "rails@" + PRIMARY_SERVER_IP
      tmux_command "pwd"
      tmux_command "/usr/bin/ruby soa_demo/soa_publisher_node.rb;"
    end
  end
end

if __FILE__ == $0
  Runbook::Runner.new(runbook).run(start_at: 1, auto: true)
else
  runbook
end

