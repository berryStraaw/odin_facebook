class AddSurnameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :surname, :string
    add_column :users, :dateOfBirth, :date
    add_column :users, :gender, :string
  end
end
