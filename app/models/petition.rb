class Petition < ActiveRecord::Base
 belongs_to :user
 
 has_many :votes
 
 def voted_by?(user)
 	votes.where(user_id: user_id).any?
 end

end
