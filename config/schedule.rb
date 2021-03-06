# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

# set :output, 'log/cron.log' #設定log的路徑
# env :PATH, ENV['PATH'] #要用bundle時必須要加

# set :environment, 'production'
# set :environment, :development

every 1.day do
  runner "Booking.the_before_booking_day"
end

every 1.hour do
  runner "Booking.the_delete_no_paid"
end
# every 1.minute do
#   rake "dev:the_delete_no_paid"
# end


# every 1.minute do
#     rake "dev:jobs"
# end




