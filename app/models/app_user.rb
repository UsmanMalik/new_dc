class AppUser < ApplicationRecord
  belongs_to :user
  enum status: [:invited, :active, :disabled]  
end
