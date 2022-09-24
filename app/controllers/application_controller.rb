class ApplicationController < ActionController::Base

  protected

  def after_sign_in_path_for(resource)
    case resource.class.name
    when 'AdminUser'
      admin_books_path
    else
      root_path
    end
  end
end
