#!/usr/bin/env ruby
require "runbook"
require_relative "rbenv"

runbook = Runbook.book "Soa Demo" do
  server PRIMARY_SERVER_IP
  section "check status" do
    step "git pull" do
      command "cd /home/rails/soa_demo; git pull", raw: true
    end
    step "bundle" do
      command "cd /home/rails/soa_demo; /home/rails/.rvm/gems/ruby-2.6.3/bin/bundle", raw: true
    end
  end
end


if __FILE__ == $0
  Runbook::Runner.new(runbook).run(start_at: 1, auto: true)
else
  runbook
end
