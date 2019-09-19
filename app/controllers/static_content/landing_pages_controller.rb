class StaticContent::LandingPagesController < StaticContent::BaseController
    before_action :authenticate_user!
    def index
        
    end
end
