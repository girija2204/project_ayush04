class CreateCommMemberships < ActiveRecord::Migration
  def change
    create_table :comm_memberships do |t|
      t.integer :comm_id
      t.integer :member_id

      t.timestamps null: false
    end
    add_index :comm_memberships, :comm_id
    add_index :comm_memberships, :member_id
    add_index :comm_memberships, [:comm_id, :member_id]
  end
end
