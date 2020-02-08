#!/usr/bin/env ruby
require "runbook"
require_relative "rbenv"

runbook = Runbook.book "Startup" do
  section "Run Primary" do
    step "run" do
      server PRIMARY_SERVER_IP
      command "cd soa_demo; /home/rails/.rvm/rubies/ruby-2.6.3/bin/ruby soa_publisher_node.rb", raw: true
    end
  end
end

if __FILE__ == $0
  Runbook::Runner.new(runbook).run(start_at: 1, auto: true)
else
  runbook
end
