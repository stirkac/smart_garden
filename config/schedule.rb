# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
set :environment, :production
set :output, '/home/pi/whenever.log'
env :GEM_PATH, ENV['GEM_PATH']

every 3.minutes do
  runner "Status.new.make_reading"
end

every 24.hours do
	command "rm /home/pi/whenever.log"
end

every :reboot do
	command "cd /home/pi/Projects/smart_garden && rvmsudo rails s -b 0.0.0.0 -p 80 -e production"
end

#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
