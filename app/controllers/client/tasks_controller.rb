class Client::TasksController < Client::BaseController

    def index
        @tasks = current_user.tasks
    end
    
    def new		
		@groups = current_user.groups
    end
    
	def create

		if params[:task][:fields].present? and params[:task][:title].present? and params[:task][:group_ids].present?

			if current_user.tasks.exists?(:title => params[:task][:title])
				flash[F_PARA[:err]] = "Task title already exists please choose a new task name."
				render json: {J_PARA[:redirect] => client_tasks_path}
				return
			end

			label_name = []
			json = JSON.parse(params[:task][:fields])

			json['fields'].each do |obj|
				label_name.push(obj["label"])
			end

			if label_name.uniq.length != label_name.length
				flash[F_PARA[:err]] = "Label must be unique for each element. Please recreate and make sure labels are unique."
				render json: {J_PARA[:redirect] => tasks_path}
				return
			end

			@task = current_user.tasks.create(fields: JSON.parse(params[:task][:fields]), title: params[:task][:title], description: 'This is just a test des. IN MODEL')
			if @task
				group_ids = params[:task][:group_ids]
				group_ids.each do |g_id|
					# Need to find the group id of admin use gon gem to achieve this that can be the best solution or probably we don't need that 
					if g_id == "-999" #For all users group and it is to be sent to all users						
						TaskGroupMembership.create(task_id: @task.id, group_id: User.where(user_type: :super_admin).first.groups.first.id)
					else
						TaskGroupMembership.create(task_id: @task.id, group_id: g_id)
					end
				end
				
				# Send FCM trigger to the users
				
				flash[F_PARA[:info]] = "Task Created Successfully."
				render json: {J_PARA[:redirect] => client_dashboard_index_path}, status: :created
			else
				flash[F_PARA[:err]] = "There is issue creating a task, please try again."
				# render json: {J_PARA[:err] => form.errors.full_messages}, status: :unprocessable_entity
			end
		else
			render json: {J_PARA[:err] => ERRORS[:INCOMPLETE_DATA]}, status: :not_acceptable
		end
	end

end