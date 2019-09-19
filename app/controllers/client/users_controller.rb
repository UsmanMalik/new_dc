class Client::UsersController < Client::BaseController

    def index
        @app_users = AppUser.where(client_admin_id: current_user.id).paginate(page: params[:page], per_page: 10)
        # @new_app_user = AppUser.new
        @new_app_user = User.new
    end

    def new
        
    end

    def create
        # @user = current_user.app_users
        @user = User.new(app_user_params)
        @user.user_type = User.user_types["app_user"]
        respond_to do |format|
			if @user.save
                flash[F_PARA[:info]] = "User created successfully."
                
                puts "user saved ******** "
                @client_app_user = AppUser.create(user_id: @user.id, client_admin_id: current_user.id, status: AppUser.statuses["invited"], auth_token: generate_token)
				# current_admin.send_user_creation_mail(@user)
				# CreateUserEmailWorker.perform_in(2.seconds,@user.id,current_admin.id)
				format.js
				format.html {redirect_to client_users_path}				
			else
                flash[F_PARA[:err]] = "There is issue creating a user, please try again."	
                
                puts "user not saved *****"
				# format.js
				# format.html {
				# 	flash[F_PARA[:err]] = @user.errors.full_messages
				# 	redirect_to users_path
				# }				
			end
		end


        
    end


    # def create
	# 	@user = current_admin.users.new(user_params)
	# 	respond_to do |format|
	# 		if @user.save
	# 			flash[F_PARA[:info]] = "User created successfully."
	# 			# current_admin.send_user_creation_mail(@user)
	# 			CreateUserEmailWorker.perform_in(2.seconds,@user.id,current_admin.id)
	# 			format.js
	# 			format.html {redirect_to users_path}				
	# 		else
	# 			flash[F_PARA[:err]] = "There is issue creating a user, please try again."					
	# 			format.js
	# 			format.html {
	# 				flash[F_PARA[:err]] = @user.errors.full_messages
	# 				redirect_to users_path
	# 			}				
	# 		end
	# 	end
    # end

    private

    def app_user_params
        params.require(:user).permit(:first_name, :last_name, :email, :phone,
            :password, :password_confirmation)
    end
    
    
end