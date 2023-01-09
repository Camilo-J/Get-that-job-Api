class FollowingsController < ApplicationController
  def index
    @followings = Following.all

    render json:  @followings
  end

  # POST /games
  def create
    if params[:company_id] # 1

      puts params[:company_id]
      company = Company.find(params[:company_id])
      following = company.followings.new(following_params)
    else
      job = Job.find(params[:job_id])

      puts params[:following]

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

  # DELETE /games/:id
  def destroy
    following = Following.find(params[:id])
    following.destroy

    render json: nil, status: :no_content
  end

  def following_params
    params.require(:following).permit(:user_id)
  end
end
