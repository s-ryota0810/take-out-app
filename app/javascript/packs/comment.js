import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from '@rails/ujs'
require('packs/raty')

axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

window.$ = window.jQuery = require('jquery');

document.addEventListener('DOMContentLoaded', () => {
  const dataset = $('#shop_show').data()
  const shopId = dataset.shopId



  

  
})