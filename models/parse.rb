require 'csv'
require 'sqlite3'

$db = SQLite3::Database.new "sweeps.db"

class SweepingData
	attr_reader :blockside, :blocksweep, :cnn, :cnnrightle, :corridor, :district, :fromhour, :holidays, :lf_fadd, :lf_toadd, :nhood, :rt_fadd, :rt_toadd, :streetname, :tohour, :week1ofmon, :week2ofmon, :week3ofmon, :week4ofmon, :week5ofmon, :weekday, :zip_code, 

	def initialize(args={})
		@blockside = args.fetch(:blockside, "")
		@blocksweep = args.fetch(:blocksweep, "")
		@cnn = args.fetch(:cnn, "")
		@cnnrightle = args.fetch(:cnnrightle, "")
		@corridor = args.fetch(:corridor, "")
		@district = args.fetch(:district, "")
		@fromhour = args.fetch(:fromhour, "")
		@holidays = args.fetch(:holidays, "")
		@lf_fadd = args.fetch(:lf_fadd, "")
		@lf_toadd = args.fetch(:lf_toadd, "")
		@nhood = args.fetch(:nhood, "")
		@rt_fadd = args.fetch(:rt_fadd, "")
		@rt_toadd = args.fetch(:rt_toadd, "")
		@streetname = args.fetch(:streetname, "")
		@tohour = args.fetch(:tohour, "")
		@week1ofmon = args.fetch(:week1ofmon, "")
		@week2ofmon = args.fetch(:week2ofmon, "")
		@week3ofmon = args.fetch(:week3ofmon, "")
		@week4ofmon = args.fetch(:week4ofmon, "")
		@week5ofmon = args.fetch(:week5ofmon, "")
		@weekday = args.fetch(:weekday, "")
		@zip_code = args.fetch(:zip_code, "")
	end
end

class SweepingDataParser
	attr_reader :file

	def initialize(file)
		@file = file
		@data = []
	end

	def read_from_file
		CSV.foreach(@file, headers: true, header_converters: :symbol) do |row|
    		save(SweepingData.new(row))
    end
  end

  def save(sweep)
  	$db.execute(
  		<<-SQL
  			CREATE TABLE sweeps (
  				id INTEGER PRIMARY KEY AUTOINCREMENT,
  				blocksweep VARCHAR(64),
  				cnn VARCHAR(64),
  				cnnrightle VARCHAR(64),
  				corridor VARCHAR(64),
  				district VARCHAR(64),
  				fromhour VARCHAR(64),
  				holidays VARCHAR(64),
  				lf_fadd VARCHAR(64),
  				lf_toadd VARCHAR(64),
  				nhood VARCHAR(64),
  				rt_fadd VARCHAR(64),
  				rt_toadd VARCHAR(64),
  				streetname VARCHAR(64),
  				tohour VARCHAR(64),
  				week1ofmon BOOLEAN,
  				week2ofmon BOOLEAN,
  				week3ofmon BOOLEAN,
  				week4ofmon BOOLEAN,
  				week5ofmon BOOLEAN,
  				weekday VARCHAR(64),
  				zip_code VARCHAR(64)
  			);
			SQL
		)
  $db.execute(
  	<<-SQL
  		INSERT INTO sweeps
  		(blockside, blocksweep, cnn, cnnrightle, corridor, district, fromhour, holidays, lf_fadd, lf_toadd, nhood, rt_fadd, rt_toadd, streetname, tohour, week1ofmon, week2ofmon, week3ofmon, week4ofmon, week5ofmon, weekday, zip_code)
  		VALUES
  		( "#{sweep.blockside}", "#{sweep.blocksweep}", "#{sweep.cnn}", "#{sweep.cnnrightle}", "#{sweep.corridor}", "#{sweep.district}", "#{sweep.fromhour}", "#{sweep.holidays}", "#{sweep.lf_fadd}", "#{sweep.lf_toadd}", "#{sweep.nhood}", "#{sweep.rt_fadd}", "#{sweep.rt_toadd}", "#{sweep.streetname}", "#{sweep.tohour}", "#{sweep.week1ofmon}", "#{sweep.week2ofmon}", "#{sweep.week3ofmon}", "#{sweep.week4ofmon}", "#{sweep.week5ofmon}", "#{sweep.weekday}", "#{sweep.zip_code}" )
  	SQL
  )

	end

end

data = SweepingDataParser.new('../sfsweeproutes/sfsweeproutes.csv')
data.read_from_file