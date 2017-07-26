# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'ajax:success', '.cart_item_increment, .cart_item_decrement', () ->
    sign = 1
    if ($(this).hasClass('cart_item_decrement'))
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
    cart_item.find('.count span').text(new_count)
    cart_item.find('.total span').text(new_total)
    update_total_sum price * sign

  $(document).on 'cocoon:before-remove', '.subitems', (e, elem) ->
    subitem_price = parseInt($(elem).find(':selected').attr('data-price'))
    subitems = $(elem).closest('.product').find('.subitems');
    subitems_price_total = parseInt(subitems.data('price-total')) - subitem_price;
    subitems_price_display = $(elem).closest('.product').find('.subitems-price span');
    subitems_price_display.text(subitems_price_total);
    subitems.data('price-total', subitems_price_total)
    update_total_sum -subitems_price

  $(document).on 'cocoon:after-insert', '.subitems', (e, elem) ->
    subitem_price = parseInt($(elem).find(':selected').attr('data-price'))
    # subitem_price = parseInt($($(elem.find('option'))[0]).data('price'))
    subitems = $(elem).closest('.product').find('.subitems');
    subitems_price_total = parseInt(subitems.data('price-total')) + subitem_price;
    subitems_price_display = $(elem).closest('.product').find('.subitems-price span');
    subitems_price_display.text(subitems_price_total);
    subitems.data('price-total', subitems_price_total)
    update_total_sum subitems_price

  previous_value = 0;
  $(document).on 'focus', '.subitems select', (e) ->
    previous_value = parseInt($(this).find(':selected').attr('data-price'))

  $(document).on 'change', '.subitems select', (e) ->
    new_value = parseInt($(this).find(':selected').attr('data-price'))
    console.log previous_value, new_value
    subitems = $(this).closest('.product').find('.subitems');
    subitems_price_total = parseInt(subitems.data('price-total'))
    subitems_price_total -= previous_value;
    subitems_price_total += new_value;
    subitems.data('price-total', subitems_price_total);
    subitems_price_display = $(this).closest('.product').find('.subitems-price span');
    subitems_price_display.text(subitems_price_total);
    previous_value = new_value
    update_total_sum (new_value - previous_value)

  update_total_sum = (diff) =>
    total_items_sum = parseInt($('#total_items_sum').data('total'))
    new_total_items_sum = total_items_sum + diff
    $('#total_items_sum').data('total', new_total_items_sum)
    $('#total_items_sum span').text(new_total_items_sum)
