class ApplicationController < ActionController::Base
  require 'eventful/api'
	require 'app_stats/stats'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

end
