# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready () ->
  $('#coupon_button').click (e) ->
    e.preventDefault()
    $.ajax('/coupons/' + $('#coupon_value').val()).success (coupon) ->
      if coupon.shareable
        $('.price').html(coupon.price)
