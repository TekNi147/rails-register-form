class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :firstName, :string
    add_column :users, :lastName, :string
    add_column :users, :birthDay, :date
  end
end
