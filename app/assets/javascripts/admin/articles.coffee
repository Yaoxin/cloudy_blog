$(document).on 'turbolinks:load', ->
  $('#tabs').on 'change', ()->
    if $('#preview:visible').length > 0
      $('#preview').text('Loading...')
      $.ajax
        url: '/admin/articles/preview'
        type: 'POST'
        data:
          content: $('#content-input').val()
        success: (data)->
          $('#preview').html(data)
