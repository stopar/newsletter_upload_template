class Template < ApplicationRecord

  validates :name, presence: true
  validates :body, presence: true
  
  scope :selected, -> { where(selected: true) }

end
