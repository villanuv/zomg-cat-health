class Cat < ActiveRecord::Base
  # validations
  validates :url, presence: true
  validates :description, presence: true

  # associations
  belongs_to :user
  has_many :votes, :dependent => :destroy
end
