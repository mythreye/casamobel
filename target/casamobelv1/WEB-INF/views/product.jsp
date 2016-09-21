<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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


<jsp:include page="header.jsp"/>
<div>
  <div class="container" style="min-height: 700px;">
   <form:form commandName="product">
  
<div class="span12" style="text-align: justify; font-size: large; color:silver;">
 <div ng-app="repeatSample" ng-controller="SellerController">
 <br/><br/>
 <div class="row">
Search:<input type=text placeholder="Search" ng-model="searchText"/>
</div>
<div id="headin2"><strong> <h3>Seller List </h3></strong></div>

<table width=\"100%\" border=\"0\" id=\"tab\">
<tr><th id=\"td1\">ProductID</th><th id=\"td2\">Product NAME</th>
              <th id=\"td3\">Qantity</th><th id=\"td4\">Price</th><th id=\"td5\">Image</th><th id=\"td6\">EDIT</th><th id=\"td6\">DELETE</th>
 </tr>
 <tr class="success" ng-repeat="Seller in Sellers|filter:searchText">
 <td style="text-align: justify; font-size: large; color:silver;">{{Seller.pid}}</td>
 <td style="text-align: justify; font-size: large; color:silver;">{{Seller.pname}}</td>
 <td style="text-align: justify; font-size: large; color:silver;">{{Seller.quantity}}</td>
 <td style="text-align: justify; font-size: large; color:silver;">{{Seller.price}}</td>
 <td><img src="resources/img/{{Seller.pid}}.jpg" height="20" width="20" align="middle"/></td>
<td><a href="editproduct?id={{Seller.pid}}">Edit</a>
<td><a href="delproduct?id={{Seller.pid}}">Delete</a></td></tr>
</table>
</div>
</div>
</div>
</form:form>
</div><jsp:include page="footer.jsp"/>
<script src="resources/js/bootstrap.js"></script>