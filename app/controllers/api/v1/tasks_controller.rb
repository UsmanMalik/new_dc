module Api
    module V1
        class TasksController < Api::BaseController
            def index
                task = Task.last
                # Testing 
                user = User.find(6)
                options = {}
                options[:include] = [:app_user]
                render :json => UserSerializer.new(user,options).serialized_json
            end
        end
    end
end





# class Api::v1::TasksController < Api::v1::BaseController

#     def index
#         task = Task.last
#         # Testing 
#         user = User.find(5)
#         options = {}
#         options[:include] = [:app_user]
#         render :json => UserSerializer.new(user,options).serialized_json
#         # render :json => TaskSerializer.new(task).serialized_json
#     end

#     def create
        
#     end
# end




# module Api
#     module V1
#       class MyContoller < ApplicationController
#         api :GET, '/api/v1/articles/:article_id/my'
#         def index
#           ...
#         end
#       end
#     end
#   end
  