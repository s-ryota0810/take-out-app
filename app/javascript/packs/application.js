// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import $ from 'jquery'
import axios from 'axios'

require('packs/raty')

Rails.start()
ActiveStorage.start()

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
  
  axios.get(`/shops/${shopId}/favorites`)
    .then((response) => {
      const hasFavorited = response.data.hasFavorited
      handleFavoriteDisplay(hasFavorited)
    })
  

})