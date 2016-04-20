class ActivityLogger < ActiveRecord::Base
  belongs_to :user

  def date
	self.activity_date.strftime('%B %d, %Y')
  end
  def week
	self.activity_date.strftime('%W')
  end
  def month
	self.activity_date.strftime('%B')
  end
end
