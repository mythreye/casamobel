<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp"/>

  <div id="content">
    <div class="container" style="min-height: 700px;">
     <article class="span4">
          <div class="row">
                  <div  style="text-align: justify; font-size: medium; font-family: Script MT Bold; font-size:large; color:silver;">
                    <h3>User Registration</h3>
                    <form:form method="post" action="Success" name="NewUser" commandName="NewUser"  class="form-signin">
					<div class="card card-container">
							<div>
								<div>
									<form:input type="text" name="first_name" id="fname" class="form-control" required="true" placeholder="Enter Your Name" path="name"/>
								</div>
							</div>
							<div>
								<div>
									<form:input class="form-control" type="text" name="last_name" id="lname"  required="true" placeholder="Enter User Name" path="username"/>
								</div>
							</div>
						<div>
							<div>
									<form:input class="form-control" path="emailid" type="email" name="email" id="email"  required="true" placeholder="Enter your Email"/>
								</div>
						</div>
						
						<div>
							<div>
									<form:input class="form-control" type="password" name="password" id="password" required="true" placeholder="Enter Password" path="password"/>
						</div>
							</div>
						<div>
							<div>
									<input type="password" class="form-control" required="true" name="confirm" id="confirm"  placeholder="Confirm your Password"/>
								</div>
							</div>
						
						<div>
								<div>
									<form:input class="form-control" type="text" name="password"  required="true" id="password"  placeholder="Enter Password" path="mobilenumber"/>
								</div>
							</div>
						
						<div>
								<div>
									<form:input class="form-control" type="text" name="password"  required="true" id="password"  placeholder="Enter Your Address" path="address"/>
								</div>
							</div>
						
						<br/><br/>

						<div class="form-group ">
							<button type="submit">Register</button>
						</div>
						
											</div>
						
					</form:form>
				</div>
			</div>
		</div>
		</article>		
		</div></div></div>
<jsp:include page="footer.jsp"/>
<script src="resources/js/bootstrap.js"></script>