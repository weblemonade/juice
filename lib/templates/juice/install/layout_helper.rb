module LayoutHelper
  def title(text)
    @page_title = text
  end

  def subtitle(text)
    @subtitle = text
  end

  def html_title(text)
    @html_title = text
  end

  def doctitle
    @html_title || brand_name
  end

  def brand_name
    "App Name"
  end

  # handle flash messages with bootstrap syntax
  def flash_helper
    flash.collect{|k,msg|
      case k
      when :notice then alert_class = "success auto-dismiss"
      when :alert then alert_class = "warning"
      else alert_class = k.to_s
      end
      content_tag(:div, msg, :id => "flash-#{alert_class}", :class => "bg-#{alert_class}").html_safe
    }.compact.join
  end
end
