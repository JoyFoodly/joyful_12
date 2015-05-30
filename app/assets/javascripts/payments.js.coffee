# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

stripeResponseHandler = (status, response) ->
  $form = $('#payment-form')

  if response.error
    $form.find('.payment-errors').text(response.error.message)
    $form.find('input[type="submit"]').prop('disabled', false)
  else
    token = response.id
    $form.append($('<input type="hidden" name="stripeToken" />').val(token))
    $form.get(0).submit()

jQuery(($) ->
  $('#payment-form').submit((e)->
    $form = $(this)
    $form.find('input[type="submit"]').prop('disabled', true);
    Stripe.card.createToken($form, stripeResponseHandler)
    return false
  ))
