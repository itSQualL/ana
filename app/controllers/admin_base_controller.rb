class AdminBaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin!

  protected

  def check_admin!
    unless current_user.admin?
      head(403)
    end
  end
end
