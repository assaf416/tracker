require "rufus-scheduler"
require "rake"

scheduler = Rufus::Scheduler.new

# ...
return if defined?(Rails::Console) || Rails.env.test? || File.split($PROGRAM_NAME).last == "rake"

scheduler.every "5m" do
  begin
    # LOAD EMAIL
    #
  rescue Exception => e
    Rails.logger.error "ERROR in FTP UPLOAD "
    Rails.logger.error e.message
    Rails.logger.error e.backtrace
  end
end

scheduler.cron "00 03 * * *" do
  begin
    # BACKUP
    #
  rescue Exception => e
    Rails.logger.error "ERROR in BAKUP PROCESS "
    Rails.logger.error e.message
    Rails.logger.error e.backtrace
  end
end
