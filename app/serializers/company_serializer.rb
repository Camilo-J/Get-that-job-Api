# frozen_string_literal: true

class CompanySerializer < ActiveModel::Serializer
  attributes :id, :email, :description, :website, :name, :profile_image
end

def profile_image
  profile.service_url
end
