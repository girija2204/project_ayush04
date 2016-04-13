class CreateEducationalDetails < ActiveRecord::Migration
  def change
    create_table :educational_details do |t|

      t.references :user, index: true, foreign_key: true
      t.string :school
      t.string :degree
      t.string :field_of_study
      t.string :grade
      t.text :description
      t.timestamps null: false
    end
  end
end
