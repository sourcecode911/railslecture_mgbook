class Book < ApplicationRecord
  belongs_to :user
  has_one :cover
  accepts_nested_attributes_for :cover
  validates_format_of :isbn, :with => /\A^(?:ISBN(?:-13)?:?●)?(?=[0-9]{13}$|(?=(?:[0-9]+[-●]){4})[-●0-9]{17}$)97[89][-●]?[0-9]{1,5}[-●]?[0-9]+[-●]?[0-9]+[-●]?[0-9]$\Z/i
  validates :title, presence: true
  validates :autoren, presence: true

end
