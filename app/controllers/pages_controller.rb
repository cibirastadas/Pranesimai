# frozen_string_literal: true

class PagesController < ApplicationController
  def about
    @title = 'About Us Page'
    @name = 'Tadas Čibiras'
  end
end
