# frozen_string_literal: true

# ApplicationsJobsController api
class ApplicationsJobsController < ApplicationController
  skip_before_action :authenticate_api_v1_company!
  skip_before_action :authenticate_api_v1_user!

  def index
    @applies = ApplicationsJob.all
    render json: @applies
  end

  def show; end

  def create
    apply = ApplicationsJob.new(apply_params)

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
    params.require(:applications_job).permit(:user_id, :job_id)
  end
end
