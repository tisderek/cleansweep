require 'pathname'
require 'sqlite3'
require 'active_record'
require 'logger'
require 'rgeo'
require 'rgeo-shapefile'
require 'rgeo-activerecord'
# require 'activerecord-spatialite-adapter'
require 'active_record/connection_adapters/spatialite_adapter/railtie'


# identify root directory
APP_ROOT = Pathname.new(File.expand_path(File.join(File.dirname(__FILE__), '..')))

APP_NAME = APP_ROOT.basename.to_s

DB_PATH  = APP_ROOT.join('db', APP_NAME + ".db").to_s

if ENV['DEBUG']
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

# configure the database
database_config = { :adapter  =>  "sqlite3",
                    :database => "#{APP_ROOT}/db/cleansweep.sqlite3" }


ActiveRecord::Base.establish_connection(database_config)

Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
  filename = File.basename(model_file).gsub('.rb', '')
  autoload ActiveSupport::Inflector.camelize(filename), model_file
end

ActiveRecord::Base.establish_connection :adapter  => 'sqlite3',
                                        :database => DB_PATH
