module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    session.delete(:organization_id)
    @current_user = nil
    @current_organization = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def destroy
    log_out
    redirect_to root_url
  end

  def set_current_organization(organization)
    @current_organization = organization
    session[:organization_id] = organization.id
  end

  def get_current_organization
    @current_organization ||= Organization.find_by(id: session[:organization_id])
  end
  def destroy_current_organization
    @current_organization = nil
    session.delete(:organization_id)
  end

  def get_available_points
    if !get_current_organization.nil?
      get_current_organization().available_point
    else
      current_user().available_point
    end
  end

  def decrease_points
    points = get_available_points - PostsController::POINTS_PER_POST
    if !get_current_organization.nil?
      get_current_organization.update_column(:available_point, points)
    else
        @current_user.update_column(:available_point, points)
    end
  end
  def get_current_organization_name
    if !get_current_organization.nil?
      get_current_organization().name
    end
  end

end
