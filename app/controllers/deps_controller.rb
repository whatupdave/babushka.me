class DepsController < ApplicationController
  def search
    @deps = Dep.search(params[:q])

    respond_to do |format|
      format.html # index.html.erb
      format.yaml { render :text => @deps.map(&:info).to_yaml }
      format.json { render :json => @deps.map(&:info) }
    end
  end
end
