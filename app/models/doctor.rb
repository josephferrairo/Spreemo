class Doctor < ActiveRecord::Base
  include PersonConcern

  def name
    "Dr. #{super}"
  end
  
  belongs_to :category
end
