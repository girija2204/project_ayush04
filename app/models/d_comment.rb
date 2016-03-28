class DComment < ActiveRecord::Base
  belongs_to :discussion
  belongs_to :community
  belongs_to :user
end
