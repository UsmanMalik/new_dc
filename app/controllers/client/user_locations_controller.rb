class Client::UserLocationsController < Client::BaseController

    def index        
    end

    def new
        @user_location = UserLocation.new
    end

    # def show
    #     @user_locations = UserLocation.all  
    # end

    def create
        user_location = UserLocation.new(user_location_params)
        user_location.user = current_user
        if user_location.save
        #     puts "Location saved ************"
        #   ActionCable.server.broadcast "some_channel",
        #     user_location: user_location.latitude,
        #     user: user_location.user.first_name
        #   head :ok
        end
    end

    private

    def user_location_params
      params.require(:user_location).permit(:latitude, :longitude)
    end
    
end