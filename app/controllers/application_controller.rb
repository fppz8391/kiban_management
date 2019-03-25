class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    skip_before_action :verify_authenticity_token
    add_flash_types :success, :info, :warning, :danger
end
