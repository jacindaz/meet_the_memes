class Admin::BaseController < ApplicationController
  before_filter :authorize

  def authorize
    if user_signed_in?
      if current_user.admin == false
        flash[:alert] = "No has authorization."
        redirect_to memes_path
      end
    end
  end

end
