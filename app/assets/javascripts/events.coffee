class @EventsController
  index: ->
    $('#event').select2
      minimumInputLength: 1

    SearchEvents = (selectBox) ->
      url = selectBox.data("url") + "?weapons=" + selectBox.val()

      $.ajax
        method: "GET"
        url: url
        success: (data)->
          $('.event-list').html data

    $('#event').on 'change', ->
      SearchEvents($(@))

    $ ->
      SearchEvents($('#event'))
