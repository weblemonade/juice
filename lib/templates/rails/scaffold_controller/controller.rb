<% module_namespacing do -%>
class <%= controller_class_name %>Controller < InheritedResources::Base
  before_filter :authenticate_user!
  load_and_authorize_resource

  protected
  def collection
    @contacts ||= end_of_association_chain.paginate(:page => params[:page])
  end

  private
  def permitted_params
    params.permit <%= singular_table_name %>: %i(<%= attributes.join(' ')%>)
  end
  
end
<% end -%>
