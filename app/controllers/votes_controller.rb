class VotesController < ApplicationController
	
	def create
    vote = current_user.votes.create(permitted_params)
    redirect_to vote.petition
  end
  
  def post
  	
  end
  
  private

  def permitted_params
    params.require(:vote).permit(:petition_id)
  end

end
