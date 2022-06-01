class ApplicationController < ActionController::Base

  #before_action :authenticate_customer!, except: [:top, :about, :index, :show]

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_homes_path
    when Customer
      items_index_path
    end
  end


  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :adress, :telephone_number])
  end

end
