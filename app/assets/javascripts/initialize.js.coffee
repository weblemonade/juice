jQuery.ajaxSetup beforeSend: (xhr) ->
  xhr.setRequestHeader "Accept", "text/javascript"
  return

$ ->
  bindPlugins "body"
  return

# a helper function that can be called after elements have been
# dynamically added to the page eg:  bindPlugins('#new-element');

bindPlugins = (context) ->
  # console.log "binding standard plugins"
  
  # ignore tab key inside textareas
  $("textarea", context).keydown (e) ->
    false  if e.which is 9

  # make non a tags clickable if they have a data-url
  $(".clickable", context).click (e) ->
    console.log $(this).data("url")
    window.location = $(this).data("url") if $(this).data("url")
    return
  
  # hide an element automatically
  setTimeout (->
    $(".auto-dismiss", context).hide "slow"
    return
  ), 3000

  $(".select2", context).select2()

  # $(".datefield", context).datepicker(format: "yyyy-mm-dd").on "changeDate", ->
  #   $(this).blur()
  #   return

  return