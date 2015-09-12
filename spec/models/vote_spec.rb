require 'rails_helper'

RSpec.describe Vote, type: :model do

  it { should validate_presence_of :option }
  it { should validate_presence_of :ip_address }
  it { should belong_to :cat }

end
