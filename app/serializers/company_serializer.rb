# frozen_string_literal: true

class CompanySerializer < ActiveModel::Serializer
  attributes :id, :email, :description, :website, :name, :profile_image
end

def profile_image
  profile&.url
  # Rails.application.routes.url_helpers.rails_representation_url(profile, disposition: 'attachment', only_path: true)
end
