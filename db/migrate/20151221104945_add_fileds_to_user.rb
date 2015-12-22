class AddFiledsToUser < ActiveRecord::Migration
  def change
    change_column :users, :name, :string, :null => false
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :integer, :limit => 5
    add_column :users, :school_received_degree_from, :string
    add_column :users, :years_in_practice, :integer
  end
end
