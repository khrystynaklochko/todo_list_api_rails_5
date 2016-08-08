class Task < ApplicationRecord

  belongs_to :user
  self.per_page = 50

  validates_presence_of :title

end
