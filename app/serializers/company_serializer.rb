# frozen_string_literal: true

class CompanySerializer < ActiveModel::Serializer
  attributes :id, :email, :description, :website, :name # , :profile
end

def profile_image
  # profile&.service_url ||
  Rails.application.routes.url.helpers.url_for(profile)
end
