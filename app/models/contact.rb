class Contact < ApplicationRecord
  belongs_to :user
  validates :vorname, presence: true
  validates :nachname, presence: true
  validates :email, presence: true
  validates_format_of :email,:with => Devise::email_regexp
end
