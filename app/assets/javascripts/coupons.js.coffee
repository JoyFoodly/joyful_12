# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready () ->
  $('#coupon_button').click (e) ->
    e.preventDefault()
    coupon_value = $('#coupon_value').val()
    if coupon_value
      $.ajax('/coupons/' + coupon_value).success (coupon) ->
        if coupon.shareable
          price = pp_price(coupon.price)
          $('.price').html(price)
          if coupon.price == 0
            $('#create-account').val('Create Account')
            $('.billing-info').remove()
            $('#payment-form').unbind()
          if coupon.welcome_message
            msg = coupon.welcome_message
          else
            msg = "Promo code found! Your new price is #{price}."
          type = 'success'
          show_ajax_message msg, type
        else
          msg = "Promo code: '#{coupon_value}' not found. Contact support (support@joyful12.com) or try another code."
          type = 'warning'
          show_ajax_message msg, type


  show_ajax_message = (msg, type) ->
    $('#flash-messages').html "<div class='alert alert-#{type}'>#{msg}</div>"
    $("#flash-#{type}").delay(5000).slideUp 'slow'

  pp_price = (price) ->
    dollars = Math.floor(price/100)
    cents = price % 100
    cents = "00" if cents == 0
    "$#{dollars}.#{cents}"
