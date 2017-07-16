window.addEventListener("load", function() {
  
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();            
      reader.onload = function (e) {
        $(document.getElementById(input.id + "_medium")).css('background-image', "url(" + e.target.result + ")");
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $(".image-upload").change(function(){
    readURL(this);
  });
  
});