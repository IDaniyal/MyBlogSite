class User < ApplicationRecord
  has_many :blogs,  dependent: :destroy
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "30x30>" }, default_url: "app/assets/images/missing.jpg"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
