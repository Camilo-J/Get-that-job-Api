# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :phone, :name, :birthdate, :linkedin, :title, :experience, :education, :follows_company,:follows_jobs # , :user_cv
end

def user_cv
  curriculum.service_url
end

def follows_company
 follows = followings.map do |follow|
next unless follow.followable_type == "Company"
    {
      id: follow.id,
      type: follow.followable_type,
      job_id: follow.followable_id,
     # user_id: follow.user_id,
      data: { name: follow.followable.name,
                   profile: follow.followable.profile&.url,
                   jobs: follow.followable.jobs.where(state: 0) }
    }
  end
    follows&.reject(&:nil?)
end


def follows_jobs
 follows = followings.map do |follow|
next unless follow.followable_type == "Job"
    {
      id: follow.id,
      type: follow.followable_type,
      job_id: follow.followable_id,
     # user_id: follow.user_id,
      data: follow.followable
    }
  end
    follows&.reject(&:nil?)
end
