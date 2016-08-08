class Category < ActiveRecord::Base
  validates :specialty, presence: true
  validates :ailment, presence: true
  has_many :doctors
  has_many :patients
end
