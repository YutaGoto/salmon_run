class @EventsController
  index: ->
    $('#event').select2
      minimumInputLength: 1
      allowClear: true
      placeholder: "ブキ検索"

    $('#stage').select2
      minimumInputLength: 0
      allowClear: true
      placeholder: "ステージ検索"

    SearchEvents = (selectBox) ->
      parameters = $.param({
        weapons: $("#event").val(),
        stages: $("#stage").val()
      })

      url = selectBox.data("url") + "?" + parameters

      $.ajax
        method: "GET"
        url: url
        success: (data)->
          $('.event-list').html data

    $('#event').on 'change', ->
      SearchEvents($(@))

    $('#stage').on 'change', ->
      SearchEvents($(@))

    $ ->
      SearchEvents($('#event'))
