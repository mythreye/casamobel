<%@include file="header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
<script>
var prod = ${cart};
var prod1=${userdetails};
  angular.module('repeatSample', []).controller('SellerController', function($scope)
   {
                 $scope.Sellers=prod;
                 $scope.User=prod1;
   
          $scope.sort = function(keyname)
          {
              $scope.sortKey = keyname;   //set the sortKey to the param passed
              $scope.reverse = !$scope.reverse; //if true make it false and vice versa
          }
              
    });
</script>
 
<div class="container" style="min-height: 700px;">
<article class="span6">
<div ng-app="repeatSample" ng-controller="SellerController">
<table style="border-color: black; border-style: solid; border-width: 2; color: white;">
	<tr style="text-align: center;">
		<td><h4>Finalize Order</h4></td>
	</tr>
	<tr >
		<td>
			<table>
  				<tr ng-repeat="Seller in Sellers">
						<td>
        	            	<img src="resources/img/{{Seller.pid}}.jpg" alt="error" height="100" width="100"/>            	        	
    					</td>
    					<td>
    						<span>Name: {{Seller.pname}}</span>
        	            	<span>Id: {{Seller.pid}}</span>
						</td>
				</tr>
			</table>
    	</td>
    </tr>
	<tr>
		<td style="text-align: center;">
			<h5>Shipping Address</h5>
		</td>
	</tr>
	<tr>
	<td>
			<div>
						<span>Name:{{User.name}}</span><br/>
						<span>Address:{{User.Address}}</span><br/>
						<span>PhoneNo.:{{User.number}}</span><br/>
						<span>EmailId:{{User.email}}</span><br/>
			</div>
	</td>
	</tr>
	<tr>
		<td>
				<a class="big_button" id="complete" href="#"><br/>Complete Order</a>
				<span class="sub"><br/>By selecting this button you agree to the purchase and subsequent payment for this order.<br/><br/></span> 
		</td>
	</tr>
	<tr>
		<td><a href="payment" class="btn btn-success btn-block">Proceed To Payment <i class="fa fa-angle-right"></i></a></td>
	</tr>
	<tr>
		<td><a href="cart" class="btn btn-success btn-block">Back To Cart <i class="fa fa-angle-right"></i></a></td>
	</tr>
</table></div></article></div>
<%@include file="footer.jsp" %>