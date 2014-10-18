class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def all
    user = User.from_omniauth(request.env["omniauth.auth"])

	end
  alias_method :facebook, :all
end
