# frozen_string_literal: true

class JobSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :category, :min_salary, :max_salary, :requirements, :optional_requirements,
             :state, :created_at, :updated_at, :company_data, :applications, :users, :followings,:type_job
end

def company_data
  { name: company.name,
    email: company.email,
    website: company.website,
    profile: company.profile&.url,
    description: company.description
    }
end

def applications
  applications_jobs.map do |app|
    {
      id: app.id,
      interest: app.interest,
      job_id: app.job_id,
      user_id: app.user_id,
      state: app.state,
      created_at: app.created_at,
      updated_at: app.updated_at,
      user_data: { name: app.user.name,
                   experience: app.user.experience,
                   email: app.user.email,
                   linkedin: app.user.linkedin,
                   phone: app.user.phone,
                   title: app.user.title }
    }
  end
end
