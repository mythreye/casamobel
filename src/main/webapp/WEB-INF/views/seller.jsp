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

  <div class="container" style="min-height: 700px;">
   <form:form commandName="editseller">
  
<div class="span12" style="text-align: justify; font-size: large; color:silver;">
 <div ng-app="repeatSample" ng-controller="SellerController">
 <br/><br/>
 <div class="row">
Search:<input type=text placeholder="Search" ng-model="searchText"/>
</div>
<div id="headin2"><strong> <h3>Seller List </h3></strong></div>

<table width=\"100%\" border=\"0\" id=\"tab\">
<tr><th id=\"td1\">SELLER ID</th><th id=\"td2\">SELLER NAME</th>
              <th id=\"td3\">SELLER ADDRESS</th><th id=\"td4\">SELLER PHONE</th><th id=\"td5\">EDIT</th><th id=\"td6\">DELETE</th>
 </tr>
 <tr class="success" ng-repeat="Seller in Sellers|filter:searchText">
 <td style="text-align: justify; font-size: large; color:silver;">{{Seller.sellerid}}</td>
 <td style="text-align: justify; font-size: large; color:silver;">{{Seller.sellername}}</td>
 <td style="text-align: justify; font-size: large; color:silver;">{{Seller.selleraddress}}</td>
 <td style="text-align: justify; font-size: large; color:silver;">{{Seller.sellerphone}}</td>
<td><a href="editseller?id={{Seller.sellerid}}">Edit</a>
<td><a href="delseller?id={{Seller.sellerid}}">Delete</a></td></tr>
</table>
</div>
</div>

</form:form>
</div><jsp:include page="footer.jsp"/>
<script src="resources/js/bootstrap.js"></script>