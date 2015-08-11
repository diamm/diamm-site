$(document).ready(function () {
  var publicKey = "6Le2k8MSAAAAALGU0lbxz8cskvG7Q3uliudSQj1Y";
  
  function showRecaptcha(element) {
    Recaptcha.create(publicKey, element, {
      theme: "white"
    });
  }
  
  showRecaptcha('captchadiv');
});