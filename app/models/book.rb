class Book < ApplicationRecord
  belongs_to :user
  has_one :cover
  accepts_nested_attributes_for :cover
  validates :isbn, presence: true
  validates :title, presence: true
  validates :autoren, presence: true

end
