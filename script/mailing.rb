#!/usr/bin/env ruby

# This takes care of actually sending the email.

ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'development'

require File.dirname(__FILE__) + '/../config/boot'
require "#{RAILS_ROOT}/config/environment"
require 'console_app'

require 'digest/sha1'

addresses = Address.all_active
newsletter = Newsletter.find ARGV[1]
mailing = Mailing.new(:newsletter => newsletter, :addrcount => addresses.length)
mailing.save

addresses.each do |a|
  Delivery.transaction do
    a.create_secret
    Sender.deliver_mail(a, newsletter)
    puts "Sent to #{a.email}"
    # Time to sleep between each mail, in seconds.
    sleep 1.0
    d = Delivery.new(:address => a, :mailing => mailing)
    d.save
  end
end
