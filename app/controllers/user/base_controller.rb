class User::BaseController < ApplicationController
  layout "user_application"

  before_action :authenticate_user!
end
