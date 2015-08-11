class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|

      t.integer       :user_id

      t.string        :contact_name, null: false
      t.string        :contact_phone_number, null: false
      

      t.float         :notification_countdown_hours, default: 2
      t.float         :notification_time_on_day, default: 8
      t.float         :notification_time_preceding_day, default: 8

      t.timestamps
    end
  end
end
