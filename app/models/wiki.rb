class Wiki < ActiveRecord::Base
  belongs_to :user

  scope :public_wikis, -> (wikis) { where private: false }

  after_initialize { self.private ||= false }
end
