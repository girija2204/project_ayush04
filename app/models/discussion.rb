class Discussion < ActiveRecord::Base
  belongs_to :community
  belongs_to :user
  has_many :d_comments, dependent: :destroy
end
