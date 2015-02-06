# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
every 3.minutes do
	set :output, "/Users/home/rubylogs/pi.log"
  runner "Status.make_reading", :environment => 'development'
end

every :reboot do
	set :output, "/Users/home/rubylogs/pi.log"
	command "cd /home/pi/Projects/smart_garden && rvmsudo rails s -b 0.0.0.0 -p 80"
end

#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
