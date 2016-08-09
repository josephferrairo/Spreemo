class Category < ActiveRecord::Base
  validates :specialty, :ailment, presence: true
  has_many :doctors
  has_many :patients
end
