class User < ApplicationRecord
  has_many :followings, dependent: :destroy
end
