class AddHoursToActivityLogger < ActiveRecord::Migration
  def change
    add_column :activity_loggers, :hours, :integer
  end
end
