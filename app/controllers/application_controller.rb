class ApplicationController < ActionController::API
  before_action :authenticate_api_v1_user!
  include DeviseTokenAuth::Concerns::SetUserByToken
end
