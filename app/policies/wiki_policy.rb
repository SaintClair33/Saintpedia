class WikiPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    #record.public? || user.present? || user.can_make_private_wiki?
  end

end