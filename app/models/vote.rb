class Vote < ActiveRecord::Base

	validates :user_id, presence: true, uniqueness: { scope: :petition_id }

end
