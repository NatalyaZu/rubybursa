class VotesController < ApplicationController

  def create
    @vote = Vote.new(permitted_params)
  end
  
  private

  def permitted_params
    params.require(:vote).permit(:user_id, :petition_id)
  end

end
