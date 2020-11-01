class JobsController < ApplicationController

  def index
    # @jobs (instance variable) gives us access to the jobs outside the controller
    @jobs = Job.all
  end
end
