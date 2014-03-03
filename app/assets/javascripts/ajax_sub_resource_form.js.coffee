jQuery ->
  $('form').on 'click', '.js-remove-fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('.row').hide()
    event.preventDefault()

  $('form').on 'click', '.js-add-fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()
