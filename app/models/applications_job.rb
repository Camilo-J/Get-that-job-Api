class ApplicationsJob < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :job

  enum state: { review: 0, progress: 1, finished: 2, declined: 3 }
  
  # Validations
  validates :user_id, presence: true
  validates :job_id , presence: true, uniqueness: {scope: :user_id}

  # Callbacks
end
