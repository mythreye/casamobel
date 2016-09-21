<jsp:include page="header.jsp"/>
  <div id="content">
    <div class="container" style="min-height: 700px;">
      <div class="row">
        <article class="span8">
          <h3>Contact us</h3>
          <div class="inner-1">
            <form id="contact-form" action="sendEmail">
              <div class="success"> Contact form submitted! <strong>We will be in touch soon.</strong> </div>
              <fieldset>
                <div>
                  <label class="name">
                    <input name="yourname" id="yourname" type="text">
                    <br>
                    <span class="error">*This is not a valid name.</span> <span class="empty">*This field is required.</span> </label>
                </div>
                <div>
                  <label class="phone">
                    <input type="text" name="comments" id="comments">
                    <br>
                    <span class="error">*This is not a valid phone number.</span> <span class="empty">*This field is required.</span> </label>
                </div>
                <div>
                  <label class="email">
                    <input name="email" id="email" type="email" value="mycasamobel@gmail.com" readonly="true"/>
                    <br>
                    <span class="error">*This is not a valid email address.</span> <span class="empty">*This field is required.</span> </label>
                </div>
                <div>
                  <label class="message">
                    <textarea name="message" id="message" placeholder="enter your message with contact details"></textarea>
                    
                    <br>
                    <span class="error">*The message is too short.</span> <span class="empty">*This field is required.</span> </label>
                </div>
                <div class="buttons-wrapper"> <input type="submit" value="Send Mail"/></a></div>
              </fieldset>
            </form>
          </div>
        </article>
        <article class="span4">
          <h3>Contact info</h3>
          <div class="map"> 
            <iframe src="https://www.google.com/maps/embed/v1/place?q=Wallace+Garden+2+Street,+nungambakkam,+Chennai,+Tamil+Nadu,+India&key=AIzaSyAN0om9mFmy1QN6Wf54tXAowK4eT0ZUPrU"> </iframe>
          </div>
          <address class="address-1">
          <strong>Casa Mobel<br>
          Wallace Garden<br>
          Nungambakkam<br>Chennai-34</strong>
          <div class="overflow">
            <span>Telephone:</span>04443561083<br>
            <span>Mobile:</span>9445923717<br>
            <span>E-mail:</span> <a href="#" class="mail-1">casamobel@gmail.com</a><br>
            </address>
        </article>
      </div>
    </div>
  </div>


<jsp:include page="footer.jsp"/>
<script src="resources/js/bootstrap.js"></script>