
jQuery ($) ->
   $('tr[data-link]').click ->
    window.location = @dataset.link
    return
  return
