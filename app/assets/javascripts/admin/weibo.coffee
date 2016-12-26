$(document).on 'turbolinks:load', ->
  $('a#select_photo').click ->
    $('input[type=file]').show().focus().click().hide()

  opt =
    type: 'POST',
    url: "/photos",
    success: (data, status, xhr)->
      $("#img-input").val(data)

  $('input[type=file]').fileUpload opt