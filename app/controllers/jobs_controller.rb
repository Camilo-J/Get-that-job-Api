class JobsController < ApplicationController
  def index
    @jobs = Job.where(company_id: 1)

    render json: @jobs
  end

  # POST /games
  def create
    job = Job.new(job_params)

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

  # DELETE /games/:id
  def destroy
    job = Job.find(params[:id])
    job.destroy

    render json: nil, status: :no_content
  end

  private

  def job_params
    params.require(:job).permit(:description, :name, :category, :type, :mix_salary, :max_salary, :requirements,
                                :optional_requirements)
  end
end
