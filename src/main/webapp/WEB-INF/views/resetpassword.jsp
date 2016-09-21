<jsp:include page="header.jsp"/>
  <div class="container" style="min-height: 700px;">
      <div class="span12" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">
<h1>Change Password</h1>
  <form method="POST" action="modifypassword" >
    <fieldse>
      <p><label for="genre" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">Old Password::</label>
         <input type="password" id="opass" name="opass"/>
      </p>
      <p><label for="genre" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">New Password::</label>
         <input type="password" id="npass" name="npass"/>
      </p>
      
      <p><input type="submit" value="Change Passwpord"/></p>
      <p>${sessionScope.passstatus}</p>
    </fieldset>
  </form>  
  </div>
  </div>     
<jsp:include page="footer.jsp"/>
<script src="resources/js/bootstrap.js"></script>