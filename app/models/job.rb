class Job < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :description, length: { in: 50..2000 }
  # validates :category

  # validates :min_salary
  # validates :max_salary
  validates :requirements, length: { in: 200..2000 }, presence: true
  validates :optional_requirements, length: { in: 100..2000 }, allow_blank: true
  # Associations
  has_many :followings, as: :followable, dependent: :destroy
  belongs_to :company

  enum state: { open: 0, closed: 1 }
end
