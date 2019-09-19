class Api::BaseController < ApplicationController
  protect_from_forgery with: :null_session
  prepend_before_action :check_ip
  respond_to :json

  def  check_ip
    puts "#{request.remote_ip} ** user ip"
  end
end