ajax1 = ->
$ ->
  $('#ajax')
    .on 'ajax:complete', (event) ->
      response = event.detail[0].response
      $('#new').html(response)

$(document).on("click",ajax1)