class LoginController < ApplicationController
  def new
    render 'devise/sessions/new'
  end
end
