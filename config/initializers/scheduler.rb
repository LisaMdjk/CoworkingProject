require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '1d' do
  RequestslistController.refresh
end

scheduler.every '1min' do
  puts "IS RUFUS WORK???? yes if you see that"
end
