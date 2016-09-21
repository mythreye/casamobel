<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp"/>


  <div class="container" style="min-height: 700px;">
      <div class="span12" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">
<h1>Add a Category</h1>
  <form:form method="POST" commandName="catagory" action="addcatagory" >
    <fieldset>
      <legend style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">Category Information</legend>
      <p><label for="genre" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">Category Name::</label>
         <form:input type="text" path="catagoryname"/>
      </p>

      <p><label for="year" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">Discription:</label>
         <form:input type="text" path="description"/>
      </p>

      <p><input type="submit" value="Add Catagory"/></p>
    </fieldset>
  </form:form>  
  </div>
  </div>
      
<jsp:include page="footer.jsp"/>



<script src="resources/js/bootstrap.js"></script>