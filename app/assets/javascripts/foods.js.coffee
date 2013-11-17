cycleFunFact = ->
  $('.fun-fact').fadeOut(300)
  rand = Math.floor(Math.random()*$('.fun-fact').length);
  $('.fun-fact').eq(rand).delay(300).fadeIn(300)

startMovingFunFacts = ->
  setInterval(cycleFunFact, 4000)

jQuery ->
  $('.cooking-method-nav li').click (e)->
    e.preventDefault()
    $(this).siblings().removeClass('active')
    $(this).addClass('active')
    $('.cooking-method-instructions').hide()
    $(".cooking-method-instructions[data-cooking-method='#{$(this).data('cooking-method')}']").show()

  startMovingFunFacts()