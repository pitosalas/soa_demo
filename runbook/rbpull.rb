#!/usr/bin/env ruby
require "runbook"
require_relative "rbenv"

runbook = Runbook.book "Soa Demo" do
  server PRIMARY_IP
  section "check status" do
    step "git pull" do
      command "cd /home/rails/soa_demo; git pull", raw: true
    end
  end
end


if __FILE__ == $0
  Runbook::Runner.new(runbook).run
else
  runbook
end
