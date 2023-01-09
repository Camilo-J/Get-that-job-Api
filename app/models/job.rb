class Job < ApplicationRecord
  has_many :followings, as: :followable, dependent: :destroy
  belongs_to :company
end
