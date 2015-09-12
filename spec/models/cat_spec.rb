require 'rails_helper'

RSpec.describe Cat, type: :model do

  it "creates valid cat objects" do
    cat = Cat.new(
      url: "http://www.cats.org.uk/uploads/images/pages/photo_latest14.jpg", 
      description: "sample cat pic"
    )
    expect(cat).to be_valid
  end

  it { should validate_presence_of :url }
  it { should validate_presence_of :description }
  it { should belong_to :user }
  it { should have_many :votes }

end
