# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
 set :output, "log/cron_log.log"
#
# every 1.minutes do
#   runner "MyModel.some_method"
#   rake "petitions:check_old"
# end
#
 every :day, at: '00:01' do
   runner "VotingEndingJob.perform_later"
 end

# Learn more: http://github.com/javan/whenever
