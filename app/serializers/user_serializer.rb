# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :phone, :name, :birthdate, :linkedin, :title, :experience, :education, :user_cv
end

def user_cv
  object.curriculum.service_url
end
