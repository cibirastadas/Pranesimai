# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def login
    @msg = params[:message]
  end

  # prisijungimas
  def login_user
    user = User.new
    # patikrinama ar yra toks naudotojas
    response = user.authentification(params[:email], params[:password])
    if response.nil?
      session[:user] = nil
      redirect_to '/'
    else
      session[:user] = response
      redirect_to '/'
    end
  end

  # atsijungimas
  def logout
    session[:user] = nil
    redirect_to '/', message: 'Atsijungta'
  end
end
