# frozen_string_literal: true

class ApplicationsJobSerializer < ActiveModel::Serializer
  attributes :id, :interest, :job_id, :user_id, :state, :created_at, :updated_at, :user_data, :job_data
end

def user_data
  { name: user.name,
    experience: user.experience,
    email: user.email,
    linkedin: user.linkedin,
    phone: user.phone,
    title: user.title,
    curriculum: user.curriculum&.url }
end

def job_data
  {
    name: job.name,
    category: job.category,
    type: job.type_job,
    min_salary: job.min_salary,
    max_salary: job.max_salary,
    created_at: job.created_at,
    updated_at: job.updated_at,
    company_name: job.company.name
  }
end
