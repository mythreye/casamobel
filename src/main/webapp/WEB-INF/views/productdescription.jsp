<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp"/>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
<script>
var prod = ${list1};
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
<div class="container" style="min-height: 700px;">
<div ng-app="repeatSample" ng-controller="SellerController">
<form:form commandName="product">
   <h1 class="page-header">Products</h1>
   <table width="100%">
  	<tr>
		<td>
        	            	<img src="resources/img/{{Sellers.pid}}.jpg" alt="error" height="300" width="300"/>            	        	
    	</td>
    	<td>
    						<h1>Description</h1>
    		           		<p class="caption">Name: {{Sellers.pname}}</p>
        	            	<p class="caption">Id: {{Sellers.pid}}</p>
        	            	<p class="caption">Price: {{Sellers.price}}</p>
        	            	<p class="caption">Description: {{Sellers.description}}</p>
    	</td>
    	<td>
    	<a href="addcart?adpid={{Sellers.pid}}"><img src="resources/img/addtocartButton.png" height="50" width="150"/></a> 
    	</td>
    	<td>           
    	<a href=""><img src="resources/img/BuyNow.png" height="50" width="150"/></a>    	
    	</td>
  	</tr>
  	</table>    
	</form:form>
</div>

</div>>
	<jsp:include page="footer.jsp"/>
<script src="resources/js/bootstrap.js"></script>
