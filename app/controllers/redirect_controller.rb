class RedirectController < ApplicationController
  def refname
    redirect_to "http://github.com/benhoskings/babushka/tree/#{params[:refname]}"
  end
  def issue
    redirect_to "http://github.com/benhoskings/babushka/issues#issue/#{params[:id]}"
  end
  def commit
    redirect_to "http://github.com/benhoskings/babushka/commit/#{params[:id]}"
  end
  def docs
    redirect_to "http://rubydoc.info/github/benhoskings/babushka/master/frames"
  end
  def mailing_list
    redirect_to "http://groups.google.com/group/babushka_app"
  end
end
