jQuery ->
  $('.js-season-selector a').click (e) ->
    e.preventDefault()
    $('.js-season-input').val($(this).text())
    $('.js-season-form').submit()
