cocoon.load("resource://org/apache/cocoon/forms/flow/javascript/Form.js");

function submit() {
  var form = new Form("forms/submit-definition.xml");
  
  var remoteAddr = cocoon.request.getRemoteAddr();

  var reCaptcha = new Packages.net.tanesha.recaptcha.ReCaptchaImpl();
  reCaptcha.setPrivateKey("6Le2k8MSAAAAAAxpBfrGxL81STQnEPyUc9av5Dex");
  
  while (true) {
    form.showForm("submit-display-pipeline", { "email": from, "subject": subject, "message": body });
    
    var challenge = cocoon.request.get("recaptcha_challenge_field");
    var uresponse = cocoon.request.get("recaptcha_response_field");
    var reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);
  
    var from = cocoon.request.get("email");
    var subject = cocoon.request.get("subject");
    var body = cocoon.request.get("message");
    
    if (reCaptchaResponse.isValid()) {
      break;
    }
  }
  
  sendMail(from, subject, body);    
  cocoon.sendPage("submit-success-pipeline");
}

function sendMail(from, subject, body) {
  
  var sender = "diamm@music.ox.ac.uk";
  var to = "diamm@music.ox.ac.uk";
  var replyTo = new Array(new Packages.javax.mail.internet.InternetAddress(from));
  var smtp = "smtp.kcl.ac.uk";
 
  var p = new Packages.java.util.Properties();
  p.put("mail.smtp.host", smtp);
  
  var session = Packages.javax.mail.Session.getInstance(p);

  var message = new Packages.javax.mail.internet.MimeMessage(session);
  
  message.setFrom(new Packages.javax.mail.internet.InternetAddress(sender));
  message.setReplyTo(replyTo);
  message.setRecipients(Packages.javax.mail.Message.RecipientType.TO, 
    new Packages.javax.mail.internet.InternetAddress(to));
  message.setSubject(subject);
  message.setSentDate(new Packages.java.util.Date());
  message.setText(body);
  
  Packages.javax.mail.Transport.send(message);
  
}