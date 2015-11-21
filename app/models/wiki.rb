class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :users, through: :collaborators
  has_many :collaborators
  default_scope {order('created_at ASC')}
  #scope :visible_to, -> (user) {where(private: true) }

  def public?
    private == false
  end
end
