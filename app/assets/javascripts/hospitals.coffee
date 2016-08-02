# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.JMI ||= {}



JMI.hospitals =
  init: ->
    @bindings()

  bindings: ->
    $("#hospital_name").chosen()
      .on 'change', ->
        $.post("/hospitals/set_current_hospital", {id: $(this).val()})
    



