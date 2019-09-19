class Task < ApplicationRecord
    belongs_to :user
    has_many :task_group_memberships
    has_many :submissions
end
