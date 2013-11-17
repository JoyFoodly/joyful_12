jQuery ->
  $('.cooking-method-nav li').click (e)->
    e.preventDefault()
    $(this).siblings().removeClass('active')
    $(this).addClass('active')
    $('.cooking-method-instructions').hide()
    $(".cooking-method-instructions[data-cooking-method='#{$(this).data('cooking-method')}']").show()
