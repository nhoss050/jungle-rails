class Admin::DashboardController < ApplicationController

 http_basic_authenticate_with name: ENV[ 'http_basic_auth_username'], password: ENV['http_basic_auth_password']

  def show
  end
end
