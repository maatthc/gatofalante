class AccountSwitchController < ApplicationController
  def to_user
    destroy_current_organization
    redirect_to posts_index_path
  end

  def to_organization
    set_current_organization Organization.find_by(id:params[:organization_id])
    redirect_to posts_index_path
  end
end
