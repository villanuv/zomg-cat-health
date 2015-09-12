class Vote < ActiveRecord::Base
  # validations
  validates :option, presence: true
  validates :ip_address, presence: true

  # associations
  belongs_to :cat
end
