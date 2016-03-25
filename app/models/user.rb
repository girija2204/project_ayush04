class User < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	has_many :comments
	has_many :relationships, foreign_key: "follower_id",
							 dependent: :destroy

	has_many :followed_users, through: :relationships, source: :followed

	has_many :passive_relationships, class_name: 'Relationship',
									 foreign_key: "followed_id",
									 dependent: :destroy

	has_many :followers, through: :passive_relationships
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
end
