class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dob, :date
    add_column :users, :gender, :string
    add_column :users, :education_status, :string
    add_column :users, :work_status, :string
    add_column :users, :smoking, :string
    add_column :users, :drinking, :string
    add_column :users, :diabetes_status, :string
  end
end
