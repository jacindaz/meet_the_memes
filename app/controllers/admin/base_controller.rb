class Admin::BaseController < ApplicationController
  before_filter :authorize

  def authorize
    if !current_user || current_user.admin == false
      raise ActionController::RoutingError.new('Not Found')
    end
  end

end
