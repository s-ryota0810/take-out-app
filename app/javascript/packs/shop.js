import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from '@rails/ujs'
require('packs/raty')

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

window.$ = window.jQuery = require('jquery');


const handleFavoriteDisplay = (hasFavorited) => {
  if (hasFavorited) {
    $('.with_favorited').removeClass('hidden')
  } else {
    $('.non_favorited').removeClass('hidden')
  }
}

document.addEventListener("DOMContentLoaded", () => {
  const dataset = $('#shop_show').data()
  const shopId = dataset.shopId
  
  axios.get(`/shops/${shopId}/comments`)
    .then((response) => {
      const comments = response.data
      comments.forEach((comment) => {        
        $(".comments_container").append(
          `<div class="show_comment">
          <div class="show_comment_info">
          <div class="show_comment_title">
          <span>${comment.title}</span></div>
          <div class="show_comment_user">
          <span>${comment.user.display_name}</span></div>
          </div>
          <div class="show_comment_content">
          <span>${comment.content}</span></div>
          <div class="show_comment_star">
          <div id="star-rate${comment.id}"></div>
          </div></div>`
        )
        $(`#star-rate${comment.id}`).raty({
          size: 36,
          starOff: '/assets/star-off.png',
          starOn : '/assets/star-on.png',
          starHalf: '/assets/star-half.png',
          score: comment.star,
          half: true,
          readOnly: true,
        });      
      })
    })
    
  axios.get(`/shops/${shopId}/favorites`)
    .then((response) => {
      const hasFavorited = response.data.hasFavorited
      handleFavoriteDisplay(hasFavorited)
    })
  
  $('.non_favorited').on('click', () =>{
    axios.post(`/shops/${shopId}/favorites`)
      .then((response) => {
        if (response.data.status == 'ok') {
          $('.with_favorited').removeClass('hidden')
          $('.non_favorited').addClass('hidden')
        }
      })
      
      .catch((error) => {
        window.alert('Error')
        console.log(error)
      })
  })
  
  $('.with_favorited').on('click', () =>{
    axios.delete(`/shops/${shopId}/favorites`)
      .then((response) => {
        if (response.data.status == 'ok') {
          $('.non_favorited').removeClass('hidden')
          $('.with_favorited').addClass('hidden')
        }
      })
      
      .catch((error) => {
        window.alert('Error')
        console.log(error)
      })
  })
  
  $('.modal_open').on('click', () => {
    $('.modal_overlay, .modal_window').fadeIn();
  })
  
  $('.modal_close').on('click', () => {
    $('.modal_overlay, .modal_window').fadeOut();
    
  })


  $('.comment_btn_submit').on('click', () => {
    const title = $('#comment_title').val()
    const content = $('#comment_content').val()
    const star = $('#star input:last').val()
    
    if (!title) {
      window.alert('タイトルを入力してください')
    } else if (!content) {
      window.alert('内容を入力してください');
    } else {
      axios.post(`/shops/${shopId}/comments`, {
        comment: {
          title: title,
          content: content,
          star: star,
        }
      })
        .then((response) => {
          const comment = response.data
          
          $('.comment_container').append(
            `<div class="show_comment">
            <div class="show_comment_info">
            <div class="show_comment_title">
            <span>${comment.title}</span></div>
            <div class="show_comment_user">
            ${comment.user.name}</div>
            </div>
            <div class="show_comment_content">
            <span>${comment.content}</span></div>
            <div class="show_comment_star">
            <div id="star-rate${comment.id}"></div>
            </div></div>`
          )
          location.reload()
        })
        .catch((error) => {
          window.alert(error)
        })
    }
  })

  
  $('#shop_access').on('click', () => {
    $('#shop_menus_area').addClass('hidden')
    $('#shop_comments_area').addClass('hidden')
    $('#shop_access_area').removeClass('hidden')
  })

  $('#shop_menus').on('click', () => {
    $('#shop_comments_area').addClass('hidden')
    $('#shop_access_area').addClass('hidden')
    $('#shop_menus_area').removeClass('hidden')
  })

  $('#shop_comments').on('click', () => {
    $('#shop_access_area').addClass('hidden')
    $('#shop_menus_area').addClass('hidden')
    $('#shop_comments_area').removeClass('hidden')
  })
  
  let counter = 0
  let sliderWidth = $('.slider-wrapper').innerWidth()
  let listCount = $('.slider-item').length

  $('.slider').css('width', `calc(100% * ${listCount})`)
  $('.slider-item').css('width', `calc( 100% / ${listCount})`)
  
  $('.prev-btn').on('click', () => {
    if (counter > 0) {
      counter--
      $('.slider').css('margin-left', (-1) * counter * sliderWidth)
    }
  })
  
  $('.next-btn').on('click', () => {
    if (counter < (listCount - 1)) {
      counter++
      $('.slider').css('margin-left', (-1) * counter * sliderWidth)
    }
  })
})