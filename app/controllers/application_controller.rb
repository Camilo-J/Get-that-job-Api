class ApplicationController < ActionController::API
  before_action :authenticate_api_v1_user!
  before_action :authenticate_api_v1_company!
  include DeviseTokenAuth::Concerns::SetUserByToken
end
