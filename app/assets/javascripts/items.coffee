# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
    $(document).on 'change', '#item_category_id', () ->
        category_id = $(this).find(":selected").attr("value")
        item_id = $('#item-id-input').attr("value")
        console.log(item_id, category_id)

        callback = (response) ->
          $('#fields').empty()
          $.each response, (index, item) ->
            console.log(index, item)
            $('#fields').append(item.name + ' <input type="text" name="item_field['+item.cf_id+']" value="'+item.value+'"/><br>')
            # $('#fields').append(item.name + ':' + item.value + '<br>')

        $.get '/category_fields_item/' + item_id + '/' + category_id + '.json', callback, 'json'
