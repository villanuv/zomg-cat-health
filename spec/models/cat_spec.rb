require 'rails_helper'

RSpec.describe Cat, type: :model do

  it { should validate_presence_of :url }
  it { should validate_presence_of :description }
  it { should belong_to :user }
  it { should have_many :votes }

end
