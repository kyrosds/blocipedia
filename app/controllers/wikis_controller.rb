class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wikis = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wikis = Wiki.new
    @wikis.title = params[:wiki][:title]
    @wikis.body = params[:wiki][:body]

    if @wikis.save
      flash[:notice] = "Post was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the Wiki. Please try again."
      render :new
    end
  end

  def edit
    @wikis = Wiki.find(params[:id])
  end

  def update
    @wikis = Wiki.find(params[:id])
    @wikis.title = params[:wiki][:title]
    @wikis.body = params[:wiki][:body]

    if @wikis.save
      flash[:notice] = "Post was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the Wiki. Please try again."
      render :new
    end
  end

  def destroy
    @wikis = Wiki.find(params[:id])

    if @wikis.destroy
      flash[:notice] = "\"#{@wikis.title}\" was deleted successfuly."
      redirect_to wikis_path
    else
      flash[:alert] = "There was an error deleting the post"
      render :show
  end
end
