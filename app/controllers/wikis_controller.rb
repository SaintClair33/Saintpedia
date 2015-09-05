class WikisController < ApplicationController
  before_action :find_wiki, only: [:show, :edit, :update, :destroy]

  def index
    @wikis = Wiki.all
  end

  def show
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)

    @wiki.user_id = current_user
    
    if @wiki.save
      flash[:notice] = "Your wiki has been saved."
      redirect_to @wiki
    else
      flash[:error] = "Something went wrong."
      render :new
    end
  end

  def edit
  end

  def update
    #@wiki.user_id = current_user
    if @wiki.update_attributes(wiki_params)
      flash[:notice] = "Wiki is updated"
      redirect_to @wiki
    else 
      flash[:error] = "There was an error saving the wiki. Please try again."
      render :edit
    end
  end

  def destroy

    if @wiki.destroy
      flash[:notice] = "Wiki deleted successfully"
      redirect_to wikis_path
    else
      flash[:error] = "Something went wrong"
      render :show
    end
  end

  private

  def find_wiki
    @wiki = Wiki.find(params[:id])
  end

  def wiki_params
    params.require(:wiki).permit(:body, :title, :private)
  end
end
