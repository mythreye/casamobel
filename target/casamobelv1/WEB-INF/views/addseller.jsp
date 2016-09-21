<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp"/>

  <div class="container" style="min-height: 700px;">
      <div class="span12" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">
<h1>Add a Category</h1>
  <form:form method="POST" commandName="seller" action="addsellerpost" >
    <fieldset>
      <legend style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">Seller Information</legend>
      <p>
       <div ng-app="repeatSample" ng-controller="SellerController">
       	<div class="success" ng-repeat="Seller in Sellers|filter">
      <p><label for="genre" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">Seller Name::</label>
         <form:input type="text" path="sellername"/>
      </p>

      <p><label for="year" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">Seller Address:</label>
         <form:input type="text" path="selleraddress"/>
      </p>
		
		<p><label for="year" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">Seller PhoneNo.:</label>
         <form:input type="text" path="sellerphone"/>
      </p>
      <p><input type="submit" value="Add Seller"/></p>
    </div>
</div>
    </fieldset>    
  </form:form>  
  </div>
  </div>
      
<jsp:include page="footer.jsp"/>



<script src="resources/js/bootstrap.js"></script>