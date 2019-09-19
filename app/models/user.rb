class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :fcm_users, dependent: :destroy 
  has_many :tasks, dependent: :destroy 
  has_many :groups, dependent: :destroy 
  has_many :app_users, dependent: :destroy 
  has_many :submissions, dependent: :destroy 
  has_many :user_locations, dependent: :destroy 


  # before_save :assign_user_type
  # after_create :add_entry_to_app_user_table
  after_create :set_user_role

  enum user_type: [:super_admin, :client_admin, :app_user]
  enum user_status:  [:signup, :active, :pending, :suspended, :under_review, :blocked]

  # def assign_user_type
  #   # self.user_type = :client_admin
  # end

  def set_user_role
    if self.user_type == "app_user" 
      self.add_role('app_user')
    elsif self.user_type == "client_admin" 
      self.add_role('client_admin')
    elsif self.user_type == "super_admin" 
      self.add_role('super_admin')
    end
  end

  
  def add_entry_to_app_user_table
    if self.user_type = :app_user
     # AppUser.create(user_id: current_user.id, status: AppUser.statuses["invited"])
    end
    
  end
  
  def self.app_user?
    (:app_user).include?(self.user_type) 
  end

  def self.client_admin?
    (:client_admin).include?(self.user_type) 
  end

  def self.super_admin?
    (:super_admin).include?(self.user_type) 
  end

      
end
