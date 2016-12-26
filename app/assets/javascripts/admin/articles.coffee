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
  $('a#upload_photo').click ->
    $('input[type=file]').show().focus().click().hide()

  opt =
    type: 'POST',
    url: "/photos",
    success: (data,status,xhr)->
      txtBox = $("#content-input")
      caret_pos = txtBox.caret('pos')
      src_merged = "\n" +"![](" +data + ")\n"
      source = txtBox.val()
      before_text = source.slice(0, caret_pos)
      txtBox.val(before_text + src_merged + source.slice(caret_pos+1, source.count))
      txtBox.caret('pos',caret_pos + src_merged.length)
      txtBox.focus()

  $('input[type=file]').fileUpload opt
