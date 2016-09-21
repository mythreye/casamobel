<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header.jsp"/>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
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

<form:form commandName="product">
  
    <div class="container" style="min-height: 700px;">
        <div class="row">
            <div class="col-lg-12"> <h1 class="page-header">Products</h1> </div>
			<div ng-app="repeatSample" ng-controller="SellerController">
				<div class="success" ng-repeat="Seller in Sellers">
 				 	<div class="col-lg-3 col-md-4 col-xs-6 thumb">
    	            	<a class="thumbnail" href="productdescription?id={{Seller.pid}}">
        	            	<p class="caption">{{Seller.pname}}</p>
        	            	<p class="caption">{{Seller.pid}}</p>
        	            	<img class="img-responsive" src="resources/img/{{Seller.pid}}.jpg" alt=""/>            	        	
                		</a>
            		</div>
				</div>
			</div>
			</div>
			</div>
	<jsp:include page="footer.jsp"/>
</form:form>

<script src="resources/js/bootstrap.js"></script>
