class User < ApplicationRecord
  extend Devise::Models # added this line to extend devise model
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #  :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :followings, dependent: :destroy
end
