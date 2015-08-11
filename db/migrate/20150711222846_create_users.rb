class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string        :name, null: false
      t.string        :email, null: false
      t.string        :phone_number, null: false
      t.string        :password_hash, null: false
      t.string        :token

      t.float         :notification_countdown_hours, default: 2
      t.float         :notification_time_on_day, default: 8
      t.float         :notification_time_preceding_day, default: 8

      t.timestamps
    end
  end
end
