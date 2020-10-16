class Blog < ApplicationRecord
  scope :approved_blogs, -> { where(is_approved: true) }
  has_many :comments
  belongs_to :user
end
