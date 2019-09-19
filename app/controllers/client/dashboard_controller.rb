class Client::DashboardController < Client::BaseController

    def index
        
    end

    def check_js
        @meow = 'hello  test'
        respond_to do |format|
            format.js
          end
    end
    
end