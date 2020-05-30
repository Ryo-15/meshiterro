class ApplicationController < ActionController::Base
  # ログイン認証されていなければ、ログイン画面へリダイレクトする
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
