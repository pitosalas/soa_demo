#!/usr/bin/env ruby
require "runbook"
require_relative "rbook_env.rb"

runbook = Runbook.book "Startup Worker" do
  server "rails@" + worker_SERVER_IP
  layout [[
    :top,
    :middle,
    :bottom,
  ]]
  section "Run Primary" do
    step "Start the soa_publisher node" do
      env({TWITTER_CONSUMER_KEY: TWTITER_CONSUMER_KEY,
           TWITTER_CONSUMER_SECRET: TWITTER_CONSUMER_SECRET,
           TWITTER_ACCESS_TOKEN: TWITTER_ACCESS_TOKEN,
           TWITTER_ACCESS_SECRET: TWITTER_ACCESS_SECRET})
      command "printenv | grep TWITTER"
      command "pwd"
      command "ruby soa_publisher_node.rb"
    end
  end
end

