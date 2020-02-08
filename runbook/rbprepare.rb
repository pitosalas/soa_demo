#!/usr/bin/env ruby
require "runbook"

runbook = Runbook.book "Soa Demo" do
  server "rails@174.138.58.21"

  section "check status" do
    step "git clone the repo" do
      command "git clone https://github.com/pitosalas/soa_demo.git"
    end
  end
end


if __FILE__ == $0
  Runbook::Runner.new(runbook).run
else
  runbook
end
