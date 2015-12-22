class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name_of_pet, :null => false, :limit => 35
      t.string :type_of_pet, :null => false
      t.string :breed, :null => false, :limit => 35
      t.integer :age, :null => false
      t.float :weight, :null => false
      t.date :date_of_last_visit
      t.integer :user_id, :null => false

      t.timestamps null: false
    end
  end
end
