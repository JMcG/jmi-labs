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

      window.location.href = $(this).data('redirect-to')

    $('.select-control').chosen()