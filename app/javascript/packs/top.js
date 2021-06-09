import $ from 'jquery'


document.addEventListener("DOMContentLoaded", () => {
  let topImages = $('#top')
  let lists = $('#top li')
  let listsCount = lists.length
  let listsWidth = lists.width()
  
  topImages.css('width', (listsWidth * listsCount) + 'px')
  
  setInterval(() => {
    topImages.stop().animate({
      marginLeft: parseInt(topImages.css('margin-left'),10) - listsWidth + 'px' 
    }, () => {
      topImages.css('margin-left', '0px')
      topImages.find('li:first').appendTo(topImages)
    })
  }, 5000)

})