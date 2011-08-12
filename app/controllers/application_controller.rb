class ApplicationController < ActionController::Base
  layout 'application'

  before_filter {
    headers['X-Refspec'] = BabushkaMe::REFSPEC
  }

  def log *args
    logger.info *args
  end

  def babushka dep_name
    log "Queueing `babushka '#{dep_name}'` via delayed_job."
    Delayed::Job.enqueue BabushkaRun.new dep_name
  end
end
