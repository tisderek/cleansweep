class CreateParkingEvents < ActiveRecord::Migration
  def change
    create_table :parking_events do |t|
      t.float       :lat
      t.float       :lng
      t.string      :street_name
      t.integer     :street_number
      t.datetime    :next_sweep

      t.integer     :user_id

      t.timestamps
    end
  end
end
