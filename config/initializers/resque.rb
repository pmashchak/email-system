p 'resque'
Resque.before_fork do
  Rails.logger.info('Rescue configuration')
  Resque.logger = Logger.new("#{Rails.root}/log/resque.log")
  Resque.logger.level = Logger::DEBUG
end
