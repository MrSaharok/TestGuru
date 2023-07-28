class Users::RegistrationsController < Devise::RegistrationsController

  after_action :set_welcome_flash, only: :create

  private

  def set_welcome_flash
    flash[:notice] = "Hello, #{current_user.first_name}!"
  end
end
