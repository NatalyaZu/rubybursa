class UserMailer < ApplicationMailer
	def petition_created(petition)
		@petition = petition
		@user = petition.user
		mail to: @user.email, subject: 'Petition created'
	end
	
	def petition_hundred_votes
		@petition = Petition.find_by(id: params[:id])
		@user = petition.user
		mail to: @user.email, subject: '100 votes'
	end
end
