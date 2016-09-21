<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp"/>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
<script>
var prod = ${cart};
  angular.module('repeatSample', []).controller('SellerController', function($scope)
   {
                 $scope.Sellers=prod;
                 $scope.value=1; 
                 $scope.change=function(value)
                 {
                     $scope.products.qty=Number($scope.value);
                  };           
    });
</script>
<div class="container" style="min-height: 700px;">
<table id="cart" class="table table-hover table-condensed">
    				<thead>
						<tr  style="font-size: medium; color: white;">
							<th style="width:50%">Product</th>
							<th style="width:10%">Price</th>
							<th style="width:8%">Quantity</th>
							<th style="width:22%" class="text-center">Subtotal</th>
							<th style="width:10%"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cartitem}" var="ci">
						<form action="updateCart" method="get">
						<tr>
						
							<td data-th="Product" style="font-size: medium; color: white;">
								<div class="row center">
									<img src="resources/img/${ci.pid}.jpg" alt="..." height="100" width="100" class="img-responsive"/>
									<h4>${ci.pname}</h4>										
								</div>
							</td>
							<td data-th="Price"  style="font-size: medium; color: white;">${ci.price}</td>
							<td data-th="Quantity"  style="font-size: medium; color: white;">
								<input type="number" class="form-control text-center" min="1" value="${ci.qty}">
							</td>
							<td data-th="Subtotal" class="text-center"  style="font-size: medium; color: white;">${ci.qty*ci.price}</td>
							<td class="actions" data-th="">
								<a class="btn btn-danger btn-sm"  href="removeitem?pid=${ci.pid}"><i class="fa fa-trash-o"></i></a>						
							</td>
							
						</tr>
						</form>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr class="visible-xs">
							<td class="text-center"  style="font-size: medium; color: white;" ng-model="total"><strong>Total:${sessionScope.gtotal}</strong></td>
						</tr>
						<tr>
							<td><a href="ppage" class="btn btn-warning"><i class="fa fa-angle-left"></i> Continue Shopping</a></td>
							<td colspan="2" class="hidden-xs"></td>
							<td class="hidden-xs text-center"><strong>Total:${sessionScope.gtotal}</strong></td>
							<c:choose>
    							<c:when test="${sessionScope.gtotal > 0}">
							<td><a href="billingAddress" class="btn btn-success btn-block">Checkout<i class="fa fa-angle-right"></i></a></td>
							</c:when>
							<c:otherwise>
							<td>Add Items To Cart</td>
							</c:otherwise>
							</c:choose>
						</tr>
					</tfoot>
				</table>
</div>
</div>	  
	<jsp:include page="footer.jsp"/>
<script src="resources/js/bootstrap.js"></script>
