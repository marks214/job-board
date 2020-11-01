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

  def delete
    # remove this job from the database
    job = Job.find(params[:id])
    # local variable, not instance variable, we don't need to access this in a view
    if job.destroy
      # Success - go back to index page
      redirect_to jobs_path
    else
      # unsuccessful - show an error

    end

  end

end

