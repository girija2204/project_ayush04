class User < ActiveRecord::Base

  acts_as_voter

  has_attached_file :avatar, styles: { medium: "300*300>", thumb: "100*100>", small: "50*50>" }, default_url: "/assets/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_many :communities
  has_many :educational_details
	has_many :employment_details
  
  has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy
  
  has_many :discussions, dependent: :destroy
  has_many :d_comments, dependent: :destroy

	has_many :relationships, foreign_key: "follower_id",
							 dependent: :destroy

	has_many :followed_users, through: :relationships, source: :followed

	has_many :passive_relationships, class_name: 'Relationship',
									 foreign_key: "followed_id",
									 dependent: :destroy

	has_many :followers, through: :passive_relationships

  has_many :reverse_memberships, class_name: 'CommMembership',
                                 foreign_key: "member_id",
                                 dependent: :destroy
  
  has_many :comms, through: :reverse_memberships

  has_many :activity_loggers
  has_many :other_activities


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    def follow(other_user)
    	relationships.create(followed_id: other_user.id)
    end
    def unfollow(other_user)
    	relationships.find_by(followed_id: other_user.id).destroy
    end
    def followed_users?(other_user)
    	followed_users.include?(other_user)
    end
    def comms?(community)
      comms.include?(community)
    end
end
