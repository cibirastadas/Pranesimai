# frozen_string_literal: true

class SessionsController < ApplicationController
  protect_from_forgery
  def create_user
    user = User.new
    response = user.create_user(params[:name], params[:email], params[:password], params[:password_confirmation])
    redirect_to controller: 'sessions', action: 'register', message: response
  end

  def register
    @msg = params[:message]
  end
end
