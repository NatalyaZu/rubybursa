class PetitionsController < ApplicationController
  before_action :authorize, only: [:new, :create]

  def index
    @petitions = Petition.all
    if params[:my]
    	@petitions = @petitions.where(user: current_user)
    	render 'my_index'
    end
  end

  def show
    @petition = Petition.find(params[:id])
  end

  def create
    petition = current_user.petitions.create(permitted_params.merge({ user: User.last }))
    UserMailer.petition_created(petition).deliver_later
  #  VotingEndingJob.perform_later
    Rails.logger.info 'After mailer'
    redirect_to petition
  end

  def new
    @petition = current_user.petitions.new
  end
  
  def edit
  	 @petition = Petition.find(params[:id])
  end

	def update
		petition = current_user.petitions.find(params[:id])
		petition.update(permitted_params)
			redirect_to petition, notice: 'Петиция обновлена'
	end
	
	def destroy
		@petition = Petition.find_by(id: params[:id])
		@petition.destroy
		flash[:success] = "Петиция удалена"
		params[:my] = true
		redirect_to petitions_path(my: true)
	end
	
  private

  def permitted_params
    params.require(:petition).permit(:id, :title, :description)
  end

end
