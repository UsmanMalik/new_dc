class Client::BaseController < ApplicationController
    include Client::ClientConcern
    before_action :restricted_access
  
      layout "client"
  
    def restricted_access
    #   redirect_to client_dashboard_index_path, alert: "Access Denied" if current_user.user_status == "pending" && current_user.has_role?(:client)
    end
end
  