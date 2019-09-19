class Api::v1::AuthenticateController < Api::v1::BaseController

    def index
        task = Task.last
        render :json => TaskSerializer.new(task).serialized_json
    end

    def create
        
    end

    def sign_in_user
        email = params[:email]
        password = params[:password]
        user = User.find_by_email(email) 

        if user.valid_password?(password) && user.present?
            # Send the the token back to the user
            # console "#{app_user}"
            if user.app_user.present?
                options = {}
                options[:include] = [:app_user]
                response.headers['Access-Control-Allow-Origin'] = '*'
                render :json => UserSerializer.new(user,options).serialized_json
            else
            # create new token and send it back to the user


            end
            
        else
            # Notify password is not correct
        end

    end

    def sign_out_user
        #Update the current token. Ask user to sign in again to again 
        
    end
end