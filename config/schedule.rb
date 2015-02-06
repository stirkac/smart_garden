# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
set :environment, :development
set :output, '/home/pi/whenever.log'
env :PATH, ENV['PATH']

every 3.minutes do
  runner "Status.make_reading"
end

every :reboot do
	command "cd /home/pi/Projects/smart_garden && rvmsudo rails s -b 0.0.0.0 -p 80"
end

#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
