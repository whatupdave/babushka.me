class RunsController < ApplicationController
  respond_to :json

  def create
    @run = Run.new(run_params)
    if @run.save
      respond_to {|format| format.json { render :json => @run } }
      babushka 'babushka.me db dump'
    else
      respond_to {|format| format.json { render :json => @run, :status => 406 } }
    end
  end

  private

  def run_params
    params.slice(
      *%w[result run_at system_info dep_name source_uri]
    ).tap {|params|
      # Replace the + that something is converting to a space:
      # Apr 27 10:42:40  0000 2011
      # Apr 27 10:42:40 +0000 2011
      params['run_at'] = params.delete('run_at').gsub(/  (?=\w+ \w+?$)/, ' +')
    }
  end
end
