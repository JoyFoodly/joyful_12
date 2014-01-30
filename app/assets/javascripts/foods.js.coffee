cycleFunFact = ->
  $('.fun-fact').fadeOut(300)
  rand = Math.floor(Math.random()*$('.fun-fact').length);
  $('.fun-fact').eq(rand).delay(300).fadeIn(300)

startMovingFunFacts = ->
  setInterval(cycleFunFact, 4000)

jQuery ->
  startMovingFunFacts()
