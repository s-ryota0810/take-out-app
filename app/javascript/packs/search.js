import $ from 'jquery'

document.addEventListener('DOMContentLoaded', () => {
  $('#search_free').on('click', () => {
    $('#search_free').addClass('selected')
    $('#search_select').removeClass('selected')
    $('#search_input_free').removeClass('hidden')
    $('#search_input_select').addClass('hidden')
    $('select').val(0)
  })
  
  $('#search_select').on('click', () => {
    $('#search_select').addClass('selected')
    $('#search_free').removeClass('selected')
    $('#search_input_select').removeClass('hidden')
    $('#search_input_free').addClass('hidden')
    $('.search_field_input_form').val('')
  })

})