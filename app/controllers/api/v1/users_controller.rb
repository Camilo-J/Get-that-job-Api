module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_api_v1_company!
      def show
        user = User.find(current_api_v1_user.id)
        render json: user
      end
    end
  end
end
