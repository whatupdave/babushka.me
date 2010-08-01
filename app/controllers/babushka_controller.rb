class BabushkaController < ApplicationController
  def tarball
    Delayed::Job.enqueue BabushkaRun.new('benhoskings:babushka tarball')
    render :nothing => true
  end
end
