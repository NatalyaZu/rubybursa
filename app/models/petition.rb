class Petition < ActiveRecord::Base
 belongs_to :user
 
 has_many :votes
 
 validate :active_petition
 
 def voted_by?(user)
 	votes.where(user_id: user.id).any?
 end
 
 def expired?
 	created_at<30.day.ago
 end

end
