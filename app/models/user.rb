class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :wikis, through: :collaborators
  has_many :collaborators
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def admin?
    role == "admin"
  end

  def premium?
    role == "premium"
  end

  def can_make_private_wiki?
    premium? || admin?
  end

end