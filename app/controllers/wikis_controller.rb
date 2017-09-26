class WikisController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    @wiki.user = current_user

    if @wiki.save
      flash[:notice] = "Post was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the Wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    if @wiki.save
      flash[:notice] = "Post was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the Wiki. Please try again."
      render :new
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfuly."
      redirect_to wikis_path
    else
      flash[:alert] = "There was an error deleting the post"
      render :show
    end
  end
end
