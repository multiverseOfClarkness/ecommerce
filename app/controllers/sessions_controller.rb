class SessionsController < Devise::SessionsController
    # Redirect users after sign in
    def after_sign_in_path_for(resource)
      if resource.is_a?(Admin)
        # Redirect to the admin dashboard
        products_path
      else
        # Redirect to the user dashboard
        products_path
      end
    end
  end
  