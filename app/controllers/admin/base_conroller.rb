class Admin::BaseController < ApplicationController

  layout 'admin'

  before_action :admin_required!

  private

  def admin_required!
    redirecy_to root_path, alert: "You are not authorized to view this page." unless current_user.is_a?(Admin)
  end
end
