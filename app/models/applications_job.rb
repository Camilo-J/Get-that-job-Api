class ApplicationsJob < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :job

  enum state: { review: 0, progress: 1, finished: 2, declined: 3 }
  
  # Validations
  validates :user_id, presence: true
  validates :job_id , presence: true, uniqueness: {scope: :user_id}

  # after_create  :close_application_actual
  # Callbacks

  # def close_application_actual
  #   # si job tiene el estado cerrado, entonces las aplicaciones cambian su estado a finished
  #   puts "cerrando applications"
  #   if state != "finished" && Job.find_by(id: job_id).state == "closed"
  #     state = "finished";
  #   end
  # end
end
