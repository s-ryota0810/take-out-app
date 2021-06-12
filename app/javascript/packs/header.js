import $ from 'jquery'

document.addEventListener("DOMContentLoaded", () => {
  $('.burger-btn').on('click', () =>{
    $('.burger-btn').toggleClass('close')
    $('.header_nav').fadeToggle(200)
  })
})
