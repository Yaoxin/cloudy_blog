$(document).on 'turbolinks:load', ->
  $('a#select_photo').click ->
    $('#weibo_file').show().focus().click().hide()

  opt =
    type: 'POST',
    url: "/photos",
    success: (data, status, xhr)->
      $("#img-input").val(data)

  $('#weibo_file').fileUpload opt