class ApplicationsJob < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :job

  enum status: { review: 0, progress: 1, finished: 2, decline: 3 }
end
