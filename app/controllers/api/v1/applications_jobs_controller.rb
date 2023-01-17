# frozen_string_literal: true

module Api
  module V1
    # ApplicationsJobsController api
    class ApplicationsJobsController < ApplicationController
      skip_before_action :authenticate_api_v1_company!
      skip_before_action :authenticate_api_v1_user!

      def index
        @applies = ApplicationsJob.where(user_id: current_api_v1_user.id)
        render json: @applies
      end

      def show; end

      def create
        apply = ApplicationsJob.new(apply_params)

        if params[:user_cv].is_a?(String) && params[:user_cv].start_with?('http', 'https')
          # unless params[:user_cv].is_a?(ActionDispatch::Http::UploadedFile)
          pdf_url = params[:user_cv]
          pdf_file = URI.open(pdf_url)

          apply.user_cv.attach(io: pdf_file, filename: 'user_cv.pdf', content_type: 'application/pdf')
        end

        if apply.save
          render json: apply, status: :created
        else
          render json: { errors: apply.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def update
        apply = ApplicationsJob.find(params[:id])

        if apply.update(apply_params)
          render json: apply, status: :created
        else
          render json: { errors: apply.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      private

      def apply_params
        params.permit(:user_id, :job_id, :state, :interest, :user_cv, :user_experience)
      end
    end
  end
end
