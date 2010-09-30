class DepsController < ApplicationController
  def search
    @deps = if params[:q] == 'all'
      Dep.all
    else
      Dep.search(params[:q])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.yaml { render :text => @deps.map(&:info).to_yaml }
      format.json { render :json => @deps.map(&:info) }
    end
  end
end
