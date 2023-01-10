# frozen_string_literal: true

# FollowingsController api
class FollowingsController < ApplicationController
  skip_before_action :authenticate_api_v1_company!
  def index
    @followings = Following.all

    render json:  @followings
  end

  # POST /followings
  def create
    if params[:company_id] # 1
      company = Company.find(params[:company_id])
      following = company.followings.new(following_params)
    else
      job = Job.find(params[:job_id])
      following = job.followings.new(following_params)
    end

    if following.save
      render json: following, status: :created
    else
      render json: { errors: following.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    following = Following.find(params[:id])

    if following.update(following_params)
      render json: following, status: :created
    else
      render json: { errors: job.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /followings/:id
  def destroy
    following = Following.find(params[:id])
    following.destroy

    render json: nil, status: :no_content
  end

private

  def following_params
    params.require(:following).permit(:user_id)
  end
end
