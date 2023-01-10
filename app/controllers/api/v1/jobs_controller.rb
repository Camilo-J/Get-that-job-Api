# frozen_string_literal: true

module Api
  module V1
    # JobsController
    class JobsController < ApplicationController
      skip_before_action :authenticate_api_v1_user!
      skip_before_action :authenticate_api_v1_company!, only: %i[index]

      def index
        @jobs = if current_api_v1_user
                  Job.all
                else
                  Job.where(company_id: current_api_v1_company.id)
                end

        render json: @jobs
      end

      # POST /jobs
      def create
        job = Job.new(job_params)
        job.company_id = current_api_v1_company.id

        if job.save
          render json: job, status: :created
        else
          render json: { errors: job.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def update
        job = Job.find(params[:id])

        if job.update(job_params)
          render json: job, status: :created
        else
          render json: { errors: job.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      # DELETE /jobs/:id
      def destroy
        job = Job.find(params[:id])
        job.destroy

        render json: nil, status: :no_content
      end

      private

      def job_params
        params.require(:job).permit(:description, :name, :category, :type, :min_salary, :max_salary, :requirements,
                                    :optional_requirements, :company_id)
      end
    end
  end
end
