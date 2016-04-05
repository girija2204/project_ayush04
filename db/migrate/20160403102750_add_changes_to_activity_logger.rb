class AddChangesToActivityLogger < ActiveRecord::Migration
  def change
  	remove_column :activity_loggers, :activity_description
  	remove_column :activity_loggers, :distance
  	add_column :activity_loggers, :activity_measures, :string
  	add_column :activity_loggers, :quantities, :integer
  end
end
