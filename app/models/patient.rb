class Patient < ActiveRecord::Base
  include PersonConcern
  belongs_to :category
  has_many :appointments
end
