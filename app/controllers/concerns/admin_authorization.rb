module AdminAuthorization
  extend ActiveSupport::Concern
  
  included do
    # before_action :authorize_admin!
  end
  
  private
  
  def authorize_admin!
    unless current_user&.admin?
      flash[:error] = "You are not authorized to access this area"
      redirect_to root_path
    end
  end
end 