module Api
  module V1
    class CompaniesController < ApplicationController
      skip_before_action :authenticate_api_v1_user!
      def show
        company = Company.find(current_api_v1_company.id)
        render json: company
      end
    end
  end
end
