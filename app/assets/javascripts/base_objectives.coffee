# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.JMI ||= {}

JMI.objective_b = 
  requirements: ->
    $("#bacteria_type .select-control").chosen({disable_search_threshold: 10})
    


