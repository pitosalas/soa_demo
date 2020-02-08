#!/usr/bin/env ruby
require "runbook"
require_relative "rbenv"

runbook = Runbook.book "Startup" do
  section "Run Primary" do
    step "run" do
      server PRIMARY_SERVER_IP
      command "cd soa_demo; ruby twitter_api.rb", raw: true
    end
  end
end

if __FILE__ == $0
  Runbook::Runner.new(runbook).run
else
  runbook
end