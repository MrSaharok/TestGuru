class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_locale
  before_action :configure_sign_up_params, if: :devise_controller?

  add_flash_types :success

  def default_url_options
    { lang: (I18n.locale if I18n.locale != I18n.default_locale) }
  end

  def alert_messages_for(entity)
    entity.errors.full_messages.to_sentence
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  def after_sign_in_path_for(_resource)
    current_user.is_a?(Admin) ? admin_tests_path : tests_path
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
