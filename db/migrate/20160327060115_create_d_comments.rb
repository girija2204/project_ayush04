class CreateDComments < ActiveRecord::Migration
  def change
    create_table :d_comments do |t|
      t.text :content
      t.references :discussion, index: true, foreign_key: true
      t.references :community, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
