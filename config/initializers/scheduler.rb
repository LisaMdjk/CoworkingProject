require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

# solution find on https://stackoverflow.com/questions/20490401/how-to-get-rufus-scheduler-working-with-a-rails-app-deployed-to-heroku
#lets try
#s = Rufus::Scheduler.singleton
#s.every '1m' do
#  Rails.logger.info "hello, it's #{Time.now}"
#  Rails.logger.flush
#end

scheduler.every '1d' do
  puts "Checking requests confirmation..."
  RequestslistController.refresh
  puts "Checking DONE!"
end
