class Community < ActiveRecord::Base
  belongs_to :user
  has_many :discussions, dependent: :destroy
  has_many :d_comments, dependent: :destroy

  has_many :memberships, class_name: 'CommMembership',
  						 foreign_key: "comm_id",
  						 dependent: :destroy
  has_many :members, through: :memberships

  def join(member)
  	memberships.create!(member_id: member.id)
  end
  def leave(member)
  	memberships.find_by(member_id: member.id).destroy
  end
  def member?(member)
  	members.include?(member)
  end
end
