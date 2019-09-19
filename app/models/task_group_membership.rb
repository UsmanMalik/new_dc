class TaskGroupMembership < ApplicationRecord
    belongs_to :task 
    belongs_to :group
end
