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
    @job.save

    if @job.save
      # success!
      redirect_to jobs_path
    else
      # failures
      render :new
    end
  end

end

