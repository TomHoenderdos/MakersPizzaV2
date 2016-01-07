# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


addTagLabelToNewHiddenField = (label) ->
  $("#container > div.ingredient_fields:last-child").find("input").attr("data", label).val(label)
  return

removeTagLabel = (label) ->
  $("input[type='text'][value='#{label}']").each (i,elem) ->
    $(elem).siblings().last().attr("checked", true)
  return

# Remove empty field
cleanup_first_empty_input = ->
  $("#container").find("input:text:not([value])").parent().remove()
  return

$ ->
  pizzaController = {
    initialize: ->
      # Init nestedAttributes
      $("#container").nestedAttributes()
      return this

    fill_hidden_input: ->
      # Fill #allIngredients input with already existing ingredients
      $("#container").find("input:text[value]").each (i, elem ) ->
        if $(elem).val().length > 0
          $("#allIngredients").val (i, val) ->
            if val.length < 1
              $(elem).val()
            else
              val + "," + $(elem).val();
          return
      return this

    tag_it: ->
      # Init tag-it with autocompletion
      $('#ingredients').tagit
        singleField: true
        singleFieldNode: $("#allIngredients")
        tagSource: (search, showChoices) ->
          that = this
          $.ajax
            url: '/ingredients/autocomplete.json'
            data: q: search.term
            success: (choices) ->
              showChoices that._subtractArray(choices, that.assignedTags())
              return
          return
        afterTagAdded: (event, ui) ->
          $("#container").nestedAttributes("add")
          addTagLabelToNewHiddenField ui.tagLabel
          return
        afterTagRemoved: (event, ui) ->
          removeTagLabel ui.tagLabel
      return this


  }

  pizzaController.initialize().fill_hidden_input().tag_it()
