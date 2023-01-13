class ApplicationsJob < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :job

  enum state: { review: 0, progress: 1, finished: 2, declined: 3 }
end
