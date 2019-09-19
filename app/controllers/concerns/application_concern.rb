module ApplicationConcern
    extend ActiveSupport::Concern
  
    included do
      # before_action :authenticate_user!
      before_action :log_user_event
    end
  
    def redirect_to_user_dashboard
    #   flash[:alert] = "Access Denied. You do not have rights to access this page."
    #   if current_user.admin?
    #     redirect_to admin_dashboard_index_path
    #   elsif current_user.client?
    #     redirect_to client_dashboard_index_path
    #   elsif current_user.freelancer?
    #     redirect_to freelancer_dashboard_index_path
    #   elsif  current_user.sub_admin?
    #     redirect_to admin_dashboard_index_path
    #   else
    #     redirect_to root_path
    #   end
    end

    def log_user_event
      puts " ** Just to test concerns **"
    end
  
  end
  