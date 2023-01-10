# frozen_string_literal: true

class CompanySerializer < ActiveModel::Serializer
  attributes :id, :email, :description, :website, :name

  # create_table 'companies', force: :cascade do |t|
  #   t.string 'name'
  #   t.text 'description'
  #   t.string 'email'
  #   t.string 'website'
  #   t.datetime 'created_at', null: false
  #   t.datetime 'updated_at', null: false
  # end
end
