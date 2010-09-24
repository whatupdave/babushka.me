class RunsController < ApplicationController
  respond_to :json

  def create
    @run = Run.new(params.slice(
      *%w[result run_at system_info dep_name source_uri]
    ))
    if @run.save
      respond_to {|format| format.json { render :json => @run } }
      dump_db
    else
      respond_to {|format| format.json { render :json => @run, :status => 406 } }
    end
  end

  private

  def dump_db
    Delayed::Job.enqueue BabushkaRun.new('benhoskings:babushka.me db dump')
  end
end
