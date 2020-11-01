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

end

