<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="header.jsp"/>
<script>
var cat = ${catlist};
var sell = ${selllist};
  angular.module('repeatSample1', []).controller('reapeterController1', function($scope)
   {
                 $scope.Catagory1=cat;                
                 $scope.Seller1=sell;
             $scope.sort = function(keyname)
          	 {
              $scope.sortKey = keyname;   //set the sortKey to the param passed
              $scope.reverse = !$scope.reverse; //if true make it false and vice versa
          	 }
    });
</script>


  <div class="container" style="min-height: 700px;">
      <div class="span12" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">
<h3>Add a Product</h3>
  <form:form method="POST" modelAttribute="prdt" enctype="multipart/form-data">
    <fieldset>
      <legend style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">Product Information</legend>
      <p>
      	<label for="title" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;" required="true">Product Name:</label>
         <form:input type="text" path="pname"/>
      </p>
		<div ng-app="repeatSample1" ng-controller="reapeterController1">
		<p><label for="genre" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">Category Id:</label>
         <form:select path="catagoryid">
         	<option ng-repeat="cata in Catagory1" value="{{cata.catagoryid}}">{{cata.catagoryname}}</option>
         </form:select>
        </p>
         <p><label for="genre" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">Seller Id:</label>
         <form:select path="sellerid">
         <option ng-repeat="Sell in Seller1" value="{{Sell.sellerid}}">{{Sell.sellername}}</option>
         </form:select>
         </p>
      </div>
		<p><label for="year" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">Discription:</label>
             <form:input type="text" path="description"/>
        </p>
		<p><label for="year" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">Quantity:</label>
         <form:input type="text" path="quantity"/>
      </p>
      	<p><label for="year" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">Price:</label>
         <form:input type="text" path="price"/>
      </p>
      <p><label for="year" style="text-align: justify; font-size: medium; font-family: Script MT Bold; color:silver;">Image:</label>
         <form:input type="file" path="pimage"/>
      </p>
      <p><input type="submit" value="Add Product"/></p>
    </fieldset>
  </form:form>  
  </div>
  </div>
     
<jsp:include page="footer.jsp"/>
<script src="resources/js/bootstrap.js"></script>