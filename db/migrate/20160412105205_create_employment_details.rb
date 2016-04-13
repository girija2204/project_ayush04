class CreateEmploymentDetails < ActiveRecord::Migration
  def change
    create_table :employment_details do |t|

      t.references :user, index: true, foreign_key: true
      t.string :organisation
      t.string :position_held
      t.string :location
      t.text :description
      t.timestamps null: false
    end
  end
end
