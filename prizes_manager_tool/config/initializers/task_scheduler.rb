require 'rufus-scheduler'

scheduler = Rufus::Scheduler.start_new

scheduler.cron('0 0 * * * ') do
   Subscriber.reset_tickets
end 