class StaticContent::BaseController < ApplicationController

    layout nil
    include StaticContent::StaticContentConcern

    before_action :authenticate_user!


end