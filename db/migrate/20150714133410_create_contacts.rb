class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string        :name
      t.integer       :phone_number

      t.integer       :notification_countdown_hours
      t.integer       :notification_time_on_day
      t.integer       :notification_time_preceding_day

      t.integer       :user_id

      t.timestamps
    end
  end
end
