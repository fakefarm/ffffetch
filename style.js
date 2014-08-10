$(document).ready(function(){
  $('img').click(function(){
    var image = $(this);
    $(this).parent().hide();
    console.log(image[0].src);
  }); 
});
