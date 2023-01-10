class Company < ApplicationRecord
  extend Devise::Models # added this line to extend devise model
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #     :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  # Validations
  validates :description, length: { in: 100..2000 }, allow_blank: true
  validates :website, format: URI::DEFAULT_PARSER.make_regexp(%w[http https]), allow_blank: true
  # Associations
  has_many :followings, as: :followable, dependent: :destroy
  has_many :jobs
end
