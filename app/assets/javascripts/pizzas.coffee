# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#ingredients').tagit
    tagSource: (search, showChoices) ->
      that = this
      $.ajax
        url: '/ingredients/autocomplete.json'
        data: q: search.term
        success: (choices) ->
          showChoices that._subtractArray(choices, that.assignedTags())
          return
      return
