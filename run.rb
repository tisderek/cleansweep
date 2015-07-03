require_relative 'config/application'

file = ARGV
input = "#{ARGV[0].to_s}"

 Route.import_shapefile(input)
# Route.import_shapefile
