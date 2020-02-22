#!/usr/bin/env ruby

require "runbook"
require_relative "rbook_env.rb"

Runbook.book "Setup Worker" do
  description <<-HERE
  Assumes that an account called worker will log in
  HERE


  section "Add Ruby" do
    server "root@" + WORKER_SERVER_IP
    step "Install Ruby" do
      command "apt update"
      command "apt install -y ruby-full"
    end
  end

  section "install bundler" do
    server "worker@" + WORKER_SERVER_IP
    step "install bundler" do
      command "gem install bundler"
      command "cd soa_demo; bundle", raw: true
    end
  end

  section "Check whether everything is ok" do
    step "Clone the soa_demo repo if it is needed" do
      capture "ls", into: :res, raw: true
      ruby_command do
        if !@res.include? "soa_demo"
          command "git clone https://github.com/pitosalas/soa_demo.git"
        else
          puts "[git clone already exists]"
        end
      end
    end
  end

  section "Add soa-worker systemctl file if needed" do
    # file is at /etc/systemd/system/soa-primary.service
  end

  section "Add Papertrail" do
    step "install papertrail cli" do
      # [sudo] gem install papertrail
    end
  end
end