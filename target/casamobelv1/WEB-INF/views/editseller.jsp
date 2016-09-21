<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script>
var prod = ${list};
  angular.module('repeatSample', []).controller('SellerController', function($scope)
   {
                 $scope.Sellers=prod;
   
          $scope.sort = function(keyname)
          {
              $scope.sortKey = keyname;   //set the sortKey to the param passed
              $scope.reverse = !$scope.reverse; //if true make it false and vice versa
          }
              
    });
</script>
<jsp:include page="header.jsp"/>

  <div class="container" style="min-height: 700px;">
      <div class="span12" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">
<h1>Add a Seller</h1>
  <form:form method="POST" commandName="list" action="editseller" >
    <fieldset>
      <legend style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">Seller Information</legend>
      <p>
      	<label for="title" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;" required="true">Seller Id:</label>
         <form:input type="text" path="sellerid" readonly="true"/>
      </p>

      <p><label for="genre" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">Seller Name::</label>
         <form:input type="text" path="sellername"/>
      </p>

      <p><label for="year" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">Seller Address:</label>
         <form:input type="text" path="selleraddress"/>
      </p>

      <p><label for="year" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">Seller Phone NO.:</label>
         <form:input type="text" path="sellerphone"/>
      </p>
\

      <p><input type="submit" value="Add Catagory"/></p>
    </fieldset>
  </form:form>  
  </div>
  </div>
   

<jsp:include page="footer.jsp"/>



<script src="resources/js/bootstrap.js"></script>