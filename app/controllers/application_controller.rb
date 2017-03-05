class ApplicationController < ActionController::Base
  # Temporarily disabling CSRF token authenticity verification
  #protect_from_forgery with: :exception
  include SessionsHelper
end
