class JobsController < ApplicationController

  def index
    # @jobs (instance variable) gives us access to the jobs outside the controller
    # -in this case, index.html.erb can access @jobs
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])

    if @job.nil?
      redirect_to '/jobs'
      return
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(
      title: params[:job][:title],
      description: params[:job][:description],
      company: params[:job][:company]
    )
    result = @job.save
    if result
      # success!
      redirect_to jobs_path
    else
      # failures
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    result = @job.update(
      {
        title: params[:job][:title],
        description: params[:job][:description],
        company: params[:job][:company]
      }
    )

    if result
      redirect_to job_path(@job.id) # @job.id is the same as params[:id], as could be @job, but @job.id is more descriptive
    else
      render :edit
    end
  end

end

