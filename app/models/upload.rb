class Upload < ApplicationRecord
  belongs_to :blog

  has_attached_file :photo, styles: { medium: "700x700>", thumb: "100x100>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
