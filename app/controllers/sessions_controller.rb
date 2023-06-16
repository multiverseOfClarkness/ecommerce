class SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    case resource.role_id
    when 1
      root_path
    when 2
      root_path
    else
      # Handle other roles or default redirection
      # root_path
      root_path
    end
  end
end

  