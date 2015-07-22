class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string        :name
      t.string        :email
      t.string        :phone_number
      t.string        :password_hash
      t.string        :token

      t.integer       :notification_countdown_hours
      t.integer       :notification_time_on_day
      t.integer       :notification_time_preceding_day

      t.timestamps
    end
  end
end
