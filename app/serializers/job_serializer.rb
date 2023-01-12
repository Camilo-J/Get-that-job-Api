# frozen_string_literal: true

class JobSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :category, :min_salary, :max_salary, :requirements, :optional_requirements,
             :state, :created_at, :updated_at, :company_data, :applications_jobs, :users
end

def company_data
  { name: company.name,
    email: company.email,
    website: company.website }
end
