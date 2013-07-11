class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  def not_found
    render :nothing => true, :status => :not_found
  end
end
