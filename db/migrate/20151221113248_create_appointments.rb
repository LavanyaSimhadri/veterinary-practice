class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :date_of_visit, :null => false
      t.integer :pet_id, :null => false
      t.integer :customer_id, :null => false
      t.string :reminder_of_appointment, :null => false
      t.string :reason_for_visit, :null => false
      t.integer :user_id, :null => false

      t.timestamps null: false
    end
  end
end
