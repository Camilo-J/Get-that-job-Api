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
  has_many :applications_jobs
  has_many :users, through: :applications_jobs

  enum state: { open: 0, closed: 1 }

  # Callbacks
  after_update :close_applications

  private

  def close_applications
    # puts "State de job" + state
    # puts "Estamos cerrando applications de este job"
    job = Job.find_by(name:)
    applications = ApplicationsJob.where(job_id: job.id)
    # puts "antes"
    if job.state == 'closed'
      applications.all.each do |application|
        application.state = 'finished'
        application.save
        # puts "cerrado 1 application"
      end
    end
    # puts "depsues"
  end
end
