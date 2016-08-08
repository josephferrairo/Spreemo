require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many :doctors }
  it { should have_many :patients }
  it { should validate_presence_of(:specialty) }
  it { should validate_presence_of(:ailment) }
end
