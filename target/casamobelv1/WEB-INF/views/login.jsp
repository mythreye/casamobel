<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp"/>
  <div id="content">
    <div class="container" style="min-height: 700px;">
       <article class="span6">
       <div class="card card-container">
            <img id="profile-img" class="profile-img-card" src="resources/img/register-secure-security-user-login-icon--7.png" />
            <p id="profile-name" class="profile-name-card"></p>
                    <span id="reauth-email" class="reauth-email"></span>
                     <form method="POST" action="perform_login" class="form-signin">
                            <span id="reauth-email" class="reauth-email"></span>
                			<input id="inputusername" name="username" type="text" class="form-control" placeholder="UserName" required="true" />
                			<input id="inputpassword" type="password" id="password" name="password" class="form-control" placeholder="Password" required="true"/>
                            <button type="submit" class="btn btn-lg btn-primary btn-block btn-signin">Login</button>
                              <a href="forgotpass" class="btn btn-info btn-block">Help to login</a>
                          </form>
                                                        </div>
                          
                         </article>
        <article class="span5">
        <div class="card card-container">
        <img id="profile-img" class="profile-img-card" src="resources/img/register1.png" />
        <p style="font-size: xx-large; line-height: 250%">Register now for <span>FREE</span></p>
                      <ul  class="list-unstyled" style="line-height: 2" style="text-align: justify; font-size: large; color:silver;">
                          <li><span  style="font-size: x-large;" > See all your orders</span> </li>
                          <li><span  style="font-size: x-large;"> Fast re-order</span> </li>
                          <li><span  style="font-size: x-large;"> Save your favorites</span> </li>
                          <li><span  style="font-size: x-large;"> Fast checkout</span> </li>
                          <li><span  style="font-size: x-large;"> Get a gift </span> </li>
                      </ul>
                      <p><a href="NewUser" class="btn btn-info btn-block">Yes please, register now!</a></p>
          </div>          
        </article>
      </div>
    </div>
  </div>

  <jsp:include page="footer.jsp"/>
  <script src="resources/js/bootstrap.js"></script>