import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from '@rails/ujs'

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()



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
  


})