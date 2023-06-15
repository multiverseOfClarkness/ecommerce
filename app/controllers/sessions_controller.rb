class SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    case resource.role_id
    when 1
      admin_dashboard_path
    when 2
      customer_dashboard_path
    else
      # Handle other roles or default redirection
      # root_path
      root_path
    end
  end
end

  