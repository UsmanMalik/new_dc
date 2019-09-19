class Client::GroupsController < Client::BaseController

    def index  
        @groups = current_user.groups.paginate(page: params[:page], per_page: 10)
        @group = Group.new     
    end

    def create
        group = current_user.groups.new(group_params)
        if group.save
          flash[:notice] = "Group created successfully."
          redirect_to client_groups_path
        else
          render('new')
        end
    end

    def manage
        @all_app_users = AppUser.where(client_admin_id: current_user.id)

        @group_id = params[:group_id]
        @group = Group.find_by_id(@group_id)
  
        @all_users = []
        @all_app_users.each do |u|
          @all_users << {id: u.user.id.to_s, name: u.user.first_name.to_s + u.user.last_name.to_s, email: u.user.email.to_s}
        end
  
    end

      def get_data
        
        all_app_users = AppUser.where(client_admin_id: current_user.id)

        all_app_users_ids = []
        all_app_users.each do |u|
            all_app_users_ids << u.user.id
        end


        group = Group.find(params[:group_id])

        group_users_ids = group.group_memberships.map(&:user_id)

        users_not_in_group_ids = all_app_users_ids - group_users_ids
        @users_not_in_group = User.where(id: users_not_in_group_ids)
        @users_in_group = User.where(id: group_users_ids)

        # @current_group_users = current_user.users.where.not(id: group.users.map(&:id))

        @users_array = []
  
        @users.each do |u|
          @users_array << {id: u.id.to_s, name: u.first_name.to_s + ' ' + u.last_name.to_s}
        end
  
        render :json => @users_array.to_json
      end
  
    private

    def group_params
        params.require(:group).permit(:title, :description)
    end
    
end