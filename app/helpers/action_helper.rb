module ActionHelper
  def action_buttons(obj, size='xs')
    content_tag :div, :class => "btn-group btn-group-#{size}" do
      [link_to_view(obj), link_to_edit(obj), link_to_destroy(obj)].each do |link|
        concat link
      end
    end
  end

  def link_to_view obj, size=nil
    link_to(
      fa_icon("play-circle-o"),
      polymorphic_url(obj),
      class: 'btn btn-default'
    )
  end

  def link_to_edit obj, size=nil
    link_to(
      fa_icon("pencil"),
      polymorphic_url(obj, action: 'edit'),
      class: 'btn btn-default'
    )
  end

  def link_to_destroy obj, size=nil
    link_to(
      fa_icon("trash-o"),
      polymorphic_url(obj),
      class: 'btn btn-default',
      data: {confirm: 'Are you sure you want to? This action cannot be undone.'},
      method: :delete
    )
  end

  def save_button obj, size='md'
    'save, save and close, save and new'
  end
end
