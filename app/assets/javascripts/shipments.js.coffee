window.JMI ||= {}



JMI.shipments =
  init: ->
    @bindings()

  bindings: ->
    $("#objective_name").chosen({disable_search_threshold: 10})
      .on 'change', ->
        $.get("/base_objectives/check_requirements", { id: $(this).val() })

    $("#submit_all").on 'click', ->
      
      $("form").each ->
        $(this).submit()

  # startDateEntry: (objective_id) ->
  #   $.get("/base_objectives/new", { id: objective_id })
    