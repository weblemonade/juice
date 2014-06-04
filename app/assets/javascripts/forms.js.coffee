# dynamic form fields

add_fields = (link, association, content) ->
  new_id = new Date().getTime()
  regexp = new RegExp("new_" + association, "g")
  $("#" + association + "_fields").append content.replace(regexp, new_id)
  return

remove_fields = (link) ->
  $(link).prev("input[type=hidden]").val true
  $(link).closest("tr").hide()
  return