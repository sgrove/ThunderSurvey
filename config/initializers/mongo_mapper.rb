logger = Logger.new('log/development.log')

if ENV['MONGODB_URL'] 
    MongoMapper.config = {RAILS_ENV => {'uri' => ENV['MONGODB_URL']}}
    MongoMapper.connect(RAILS_ENV)
  else
    MongoMapper.connection = Mongo::Connection.new('127.0.0.1', 27017, :logger => logger)
    MongoMapper.database = ENV['MONGDO_DB']
end


if defined?(PhusionPassenger)
   PhusionPassenger.on_event(:starting_worker_process) do |forked|
     MongoMapper.connection.connect_to_master if forked
   end
end