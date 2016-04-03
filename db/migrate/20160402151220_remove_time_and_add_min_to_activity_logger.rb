class RemoveTimeAndAddMinToActivityLogger < ActiveRecord::Migration
  def change
  	remove_column :activity_loggers, :time
  	add_column :activity_loggers, :min, :integer
  end
end
