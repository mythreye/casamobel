<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp"/>
  <div id="content">
    <div class="container" style="min-height: 700px;">
       <article class="span6">
       <div class="card card-container">
            <img id="profile-img" class="profile-img-card" src="resources/img/register-secure-security-user-login-icon--7.png" />
            <p id="profile-name" class="profile-name-card"></p>
                    <span id="reauth-email" class="reauth-email"></span>
                     <form method="POST" action="changepass" class="form-signin">
                            <span id="reauth-email" class="reauth-email"></span>
                			<input id="username" name="username" type="text" class="form-control" placeholder="UserName" required="true" />
                			<input type="submit" value="Password"/>
                          </form>
                                                        </div>
                          
                         </article>
             </div>
    </div>
  </div>

  <jsp:include page="footer.jsp"/>
  <script src="resources/js/bootstrap.js"></script>