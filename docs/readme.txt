# Readme

## Controllers

The inherited_resources gem used in conjunction with can_can and strong parameters requires authenticating the user, validating role and permissions and finally permitting the correct form parameters.

  before_filter :authenticate_user!
  load_and_authorize_resource

  protected
  def collection
    @company ||= end_of_association_chain.paginate(:page => params[:page])
  end

  private
  def permitted_params
    params.permit company: %i(first_name last_name email phone)
  end
