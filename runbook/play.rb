#!/usr/bin/env ruby
require "runbook"
require_relative "rbenv"

runbook = Runbook.book "Uneven Layout" do
  layout [[
    {:left => 1, {name: :middle, runbook_pane: true} => 3, :right => 1},
    {bottom_left: 5, bottom_right: 5}
  ]]
  section "Run Primary" do
    step "run" do
      env({TWITTER_CONSUMER_KEY: TWTITER_CONSUMER_KEY,
           TWITTER_CONSUMER_SECRET: TWITTER_CONSUMER_SECRET,
           TWITTER_ACCESS_TOKEN: TWITTER_ACCESS_TOKEN,
           TWITTER_ACCESS_SECRET: TWITTER_ACCESS_SECRET})
      server "rails@" + PRIMARY_SERVER_IP
      tmux_command "pwd", :bottom_right
      # tmux_command "/usr/bin/ruby soa_demo/soa_publisher_node.rb", :bottom_left
      tmux_command "top", :bottom_left
    end
  end
end

if __FILE__ == $0
  Runbook::Runner.new(runbook).run(start_at: 1, auto: true)
else
  runbook
end