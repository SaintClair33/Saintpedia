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
    @wiki.user = current_user
    
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
    
  end

  def destroy
    if @wiki.destroy
      redirect_to wikis_path, notice: "Wiki deleted successfully"
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
