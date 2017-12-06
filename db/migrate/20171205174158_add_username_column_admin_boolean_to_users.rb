class AddUsernameColumnAdminBooleanToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true
    add_column :users, :admin, :boolean, default: false
    add_column :users, :is_female, :boolean, default: false
    add_column :users, :date_of_birth, :datetime
  end
end
