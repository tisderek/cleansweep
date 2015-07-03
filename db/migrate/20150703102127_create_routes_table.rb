class CreateRoutesTable < ActiveRecord::Migration
  def change
  	create_table :routes do |t|
  		# t.geometry		:geos
  		t.string			:blockside
  		t.integer			:blocksweep
  		t.integer			:cnn
  		t.string			:cnnrightle
  		t.string			:corridor
  		t.string			:district
  		t.string			:nhood
  		t.time				:fromhour
  		t.time				:tohour
  		t.string			:weekday, limit: 3
  		t.string			:zip_code, limit: 5
  		t.string			:streetname
  		t.integer			:lf_fadd
  		t.integer			:lf_toadd
  		t.integer			:rt_fadd
  		t.integer			:rt_toadd
  		t.boolean			:week1ofmon
  		t.boolean			:week2ofmon
  		t.boolean			:week3ofmon
  		t.boolean			:week4ofmon
  		t.boolean			:week5ofmon
  		t.boolean			:holidays
	  end
	end
end
