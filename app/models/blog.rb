class Blog < ApplicationRecord
  scope :approved_blogs, -> { where(is_approved: true) }
  validates :title, :length => { :minimum => 5 }
  has_many :comments, dependent: :destroy
  belongs_to :user

  has_many :uploads

  def files=(array_of_files = [])
    array_of_files.each do |f|
      uploads.build(photo: f, blog: self)
    end
  end

end
