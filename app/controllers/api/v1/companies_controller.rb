module Api
  module V1
    class CompaniesController < ApplicationController
      skip_before_action :authenticate_api_v1_user!
      def show
        company = Company.find(current_api_v1_company.id)
        render json: company
      end

      def update
        company = Company.find(current_api_v1_company.id)

        if company.update(job_params)
          render json: company, status: :created
        else
          render json: { errors: company.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def job_params
        params.permit(:description, :name, :website, :email, :profile)
      end
    end
  end
end
