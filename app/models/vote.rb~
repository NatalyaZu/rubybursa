class Vote < ActiveRecord::Base

	validates :vote, presence: true, uniqueness: { scope: :vote, message: "Вы не можете больше голосовать!" }

end
