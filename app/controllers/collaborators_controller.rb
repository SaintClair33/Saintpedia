class CollaboratorsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    wiki = Wiki.find(params[:wiki_id])

    if !user
      flash[:error] = "There is no user by that email address: #{params[:email]}"
    elsif Collaborator.create(user: user, wiki: wiki)
      flash[:notice] = "Collaborator added"
    else
      flash[:error] = "Something went wrong"
    end
    redirect_to :back
  end

  def destroy
    collaborator = Collaborator.find(params[:id])
    wiki = Wiki.find(params[:wiki_id])

    if collaborator.destroy
      flash[:notice] = "Collaborator removed"
    else
      flash[:error] = "Remove collaborator failed"
    end
    redirect_to :back
  end
end
