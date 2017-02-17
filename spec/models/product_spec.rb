require 'rails_helper'

describe Product do
  it { should have_many :reviews }
  it { should have_many(:users).through(:reviews) }
end
