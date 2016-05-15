class CreateActivityParticipations < ActiveRecord::Migration
  def change
    create_table :activity_participations do |t|
      t.references :user, index: true, foreign_key: true
      t.string :activity_name
      t.integer :goal

      t.timestamps null: false
    end
    add_index :activity_participations, [:user_id, :activity_name], unique: true
  end
end
