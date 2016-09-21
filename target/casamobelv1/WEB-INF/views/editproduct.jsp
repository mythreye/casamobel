<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp"/>

  <div class="container" style="min-height: 700px;">
      <div class="span12" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">
<h1>Add a Category</h1>
  <form:form method="POST" commandName="editproduct" action="editproduct" >
    <fieldset>
      <legend style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">Product Information</legend>
      <p>
      	<label for="title" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;" required="true">Product Id:</label>
         <form:input type="text" path="pid" readonly="true"/>
      </p>

      <p><label for="genre" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">Quantity:</label>
         <form:input type="text" path="quantity"/>
      </p>

      <p><label for="year" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">Price:</label>
         <form:input type="text" path="price"/>
      </p>

      <p><input type="submit" value="Update Catagory"/></p>
    </fieldset>
  </form:form>  
  </div>
  </div>
    

<jsp:include page="footer.jsp"/>



<script src="resources/js/bootstrap.js"></script>