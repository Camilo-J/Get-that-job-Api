class User < ApplicationRecord
  extend Devise::Models # added this line to extend devise model
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #  :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  # Validations
  validates :phone, length: { is: 9 }, allow_blank: true
  validates :experience, length: { in: 300..2000 }, allow_blank: true
  validates :education, length: { in: 100..2000 }, allow_blank: true
  validates :linkedin, format: URI::DEFAULT_PARSER.make_regexp(%w[http https]), allow_blank: true
  # Associations
  has_many :followings, dependent: :destroy
  has_one_attached :curriculum
end
