module FormHelper
  # dynamically add fields to forms
  def link_to_add_fields(name, f, association, html_options={}, atts={})
    new_object = f.object.class.reflect_on_association(association).klass.new atts
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(\"#{association}\", \"#{escape_javascript(fields)}\")", html_options)
  end

  # requires the group of input buttons to be contained in an element with class name "fields_container"
  def link_to_remove_fields(name, f, html_options)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)", html_options)
  end

  # render form fields
  def rendered_form_fields(f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s + "_fields", :f => builder)
    end
    escape_javascript(fields)
  end
end