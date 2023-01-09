class Company < ApplicationRecord
  has_many :followings, as: :followable, dependent: :destroy
  has_many :jobs
end
