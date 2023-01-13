# frozen_string_literal: true

class ApplicationsJobSerializer < ActiveModel::Serializer
  attributes :id, :interest, :job_id, :user_id, :state, :created_at, :updated_at, :user_data
end

def user_data
  { name: user.name,
    experience: user.experience,
    email: user.email,
    linkedin: user.linkedin,
    phone: user.phone,
    title: user.title }
end
