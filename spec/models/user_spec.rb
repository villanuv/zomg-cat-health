require 'rails_helper'

RSpec.describe User, type: :model do

  it "creates valid user objects" do
    user = User.new(
      username: 'somename',
      password: 'somepassword',
      password_confirmation: 'somepassword'
    )
    expect(user).to be_valid
  end

  it { should validate_presence_of :username }
  it { should validate_presence_of :password }
  it { should validate_presence_of :password_confirmation }

  it { should have_secure_password }

  it { should have_many :cats }

end