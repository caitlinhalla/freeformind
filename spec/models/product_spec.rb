require 'rails_helper'

describe Product do
  it { should have_many :reviews }
  it { should belong_to :user }
end
