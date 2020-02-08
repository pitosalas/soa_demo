#!/usr/bin/env ruby
require "runbook"

runbook = Runbook.book "Rabbit Install" do
  server "root@"+RABBIT_SERVER_IP

  section "update and install" do
    step "update and install" do
      exec "apt-get update; apt-get -y upgrade"
      exec 'echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list'
      exec 'curl http://www.rabbitmq.com/rabbitmq-signing-key-public.asc | sudo apt-key add'
      exec 'sudo apt-get install rabbitmq-server'
      #sudo nano /etc/default/rabbitmq-server
      exec "sudo rabbitmq-plugins enable rabbitmq_management"

    end
  end
end


if __FILE__ == $0
  Runbook::Runner.new(runbook).run(auto: true, start_at: 1)
else
  runbook
end
