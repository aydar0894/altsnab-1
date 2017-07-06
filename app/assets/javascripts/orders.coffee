# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
    $(document).on 'ajax:complete', '.cart_item_increment, .cart_item_decrement', () ->
      if ($(this).hasClass('cart_item_increment'))
        sign = 1
      else
        sign = -1

      cart_item = $(this).closest('.cart_item')
      price = cart_item.data('price')
      count = cart_item.data('count')
      if (sign == -1 && count <= 1)
        return

      new_count = count + 1 * sign
      new_total = price * new_count
      cart_item.data('count', new_count)
      cart_item.data('total', new_total)
      total_items_sum = $('#total_items_sum').data('total')
      new_total_items_sum = total_items_sum + price * sign
      $('#total_items_sum').data('total', new_total_items_sum)
      $('#total_items_sum span').text(new_total_items_sum)
      cart_item.find('.count span').text(new_count)
      cart_item.find('.total span').text(new_total)
