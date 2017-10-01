class CollaboratorsController < ApplicationController
  before_action :get_current_wiki

  def index
    @users = User.all
  end

  def new
    @collaborator = Collaborator.new
  end

  def create
    @collaborator = Collaborator.new(wiki_id: @wiki.id, user_id: params[:user_id])

    if @collaborator.save
      flash[:notice] = "New collaborator added."
    else
      flash[:alert] = "Error occured. Collaborator not added."
    end

    redirect_to :back
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:alert] = "Collaborator has been reomved!"
    else
      flash[:alert] = "Error occured. Collaborator could not be removed."
    end

    redirect_to :back
  end

  private

  def get_current_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end
end
