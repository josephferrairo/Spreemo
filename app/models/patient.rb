class Patient < ActiveRecord::Base
  include PersonConcern
  belongs_to :category
end
