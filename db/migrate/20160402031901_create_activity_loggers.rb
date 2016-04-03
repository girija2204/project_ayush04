class CreateActivityLoggers < ActiveRecord::Migration
  def change
    create_table :activity_loggers do |t|
      t.date :activity_date
      t.references :user, index: true, foreign_key: true
      t.string :activity_type
      t.text :activity_description
      t.integer :time
      t.integer :distance

      t.timestamps null: false
    end
    #add_index :activity_loggers, :user_id (indexing already done on user_id, when it is referenced, so no use of indexing again..)
    add_index :activity_loggers, [:user_id, :activity_type]
    add_index :activity_loggers, [:activity_date, :user_id]
  end
end
