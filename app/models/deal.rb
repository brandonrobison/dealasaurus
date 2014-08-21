class Deal < ActiveRecord::Base
  belongs_to :user
  has_many :messages, dependent: :destroy
  validates :short_description, length: { maximum: 40 }
end
