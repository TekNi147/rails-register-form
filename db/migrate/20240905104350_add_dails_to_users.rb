class AddDailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :gender, :string
    add_column :users, :email, :string
    add_column :users, :phone, :string
    add_column :users, :subject, :string
  end
end
