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

document.addEventListener("DOMContentLoaded", () => {
  $('.shop_detail_name').on('click', () => {  
    axios.get('/')
      .then((response) => {
        window.alert("success")
        console.log(response)
      })
  })
  
  
})