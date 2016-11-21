$(document).on 'turbolinks:load', ->
  $('.content-title').on 'click', ()->
    $(this).addClass('active')
    $('.preview-title').removeClass('active')
    $('#content').show()
    $('#preview').hide()
    false

  $('.preview-title').on 'click', ()->

    $(this).addClass('active')
    $('.content-title').removeClass('active')
    $('#content').hide()
    $('#preview').show()

    $.ajax
      url: "/admin/articles/preview"
      type: 'POST'
      data:
        content: $('#content-input').val()
      success: (data)->
        $('#preview').html(data)
      false
    false