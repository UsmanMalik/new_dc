class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :task
  has_one :submission_location
  has_one :submission_attachment
end
