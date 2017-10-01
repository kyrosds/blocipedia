class Wiki < ActiveRecord::Base
  belongs_to :user

  has_many :collaborators
  has_many :wikis, through: :collaborators

  after_initialize { self.private ||= false }
end
