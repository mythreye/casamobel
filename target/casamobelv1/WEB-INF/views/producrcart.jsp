<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
<%@include file="header.jsp" %>
<script>
  var prod = ${cart};
  angular.module('repeatSample', []).controller('repeatController',['$scope', function($scope)
   {
                 $scope.products=prod;
                 $scope.value=1;
                 $scope.change=function(value)
                 {
                	 $scope.products.qty=Number($scope.value);
                 };
   
              
    }]);
</script>
 <div class="container" style="min-height: 700px;">
 <form:form class="form-horizontal" method="post" action=""	commandName="CartDetail" enctype="multipart/form-data">
 <div ng-app="repeatSample" ng-controller="repeatController" >
<table class="table table-bordered table-hover table-striped">
<tr>
<th>Image</th>
<th>Item</th>
<th>Quantity</th>
<th>Price</th>
<th>Subtotal</th>
</tr>
<tr class="success">
                 <td><a href="">
					<img src="resources/img/{{products.pid}}.jpg" height="100px" width="100px"/>
				</a>
				 </td> 
            <td> {{products.pname}} <br><br><a href="RemoveFromCart?ctpid={{products.cartId}}">Remove</a>   </td>
            <td><form:input path="qty" ng-model="value"  ng-change="change(value)"/></td>
                
                <td>{{products.price}}</td>
                <td><form:label path="total">{{products.qty*products.price}}</form:label></td>
                
                  
</tr>
</table>
</div> 

</form:form> 
</div>
<%@include file="footer.jsp" %>