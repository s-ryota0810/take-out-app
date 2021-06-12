import $ from 'jquery'

document.addEventListener("DOMContentLoaded", () => {
  let menuWidth = $('.show_menu_info').width()
  $('.show_menu_info').css('height', menuWidth)
  
  $(window).resize(() => {
    let menuWidth = $('.show_menu_info').width()
    $('.show_menu_info').css('height', menuWidht)
  })
})