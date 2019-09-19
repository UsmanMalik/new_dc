class Api::TasksController < Api::BaseController

    def index
        task = Task.last
        # Testing 
        user = User.find(5)
        options = {}
        options[:include] = [:app_user]
        render :json => UserSerializer.new(user,options).serialized_json
        # render :json => TaskSerializer.new(task).serialized_json
    end

    def create
        
    end
end