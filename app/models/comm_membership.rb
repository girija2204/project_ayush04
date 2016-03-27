class CommMembership < ActiveRecord::Base
	belongs_to :comm, class_name: "Community"
	belongs_to :member, class_name: "User"
end
