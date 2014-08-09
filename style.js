$(document).ready(function(){
  $('img').click(function(){
    var image = $(this);
    $(this).hide();
    console.log(image[0].src);
  }); 
});
