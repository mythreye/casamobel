<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
<script>
var prod = ${list};
  angular.module('repeatSample', []).controller('CatogoryController', function($scope)
   {
                 $scope.Catagory=prod;
   
          $scope.sort = function(keyname)
          {
              $scope.sortKey = keyname;   //set the sortKey to the param passed
              $scope.reverse = !$scope.reverse; //if true make it false and vice versa
          }
              
    });
</script>


<jsp:include page="header.jsp"/>

  <div class="container" style="min-height: 700px;">
   <form:form commandName="editcatagory">
  
<div class="span12" style="text-align: justify; font-size: large; color:silver;">
 <div ng-app="repeatSample" ng-controller="CatogoryController">
 <br/><br/>
 <div class="row">
Search:<input type=text placeholder="Search" ng-model="searchText"/>
</div>
<div id="headin2"><strong> <h3>Catagory List </h3></strong></div>

<table width=\"100%\" border=\"0\" id=\"tab\">
<tr><th id=\"td1\">CATEGORY ID</th><th id=\"td2\">CATAGORY NAME</th>
              <th id=\"td3\">DISCRIPTION</th><th id=\"td4\">EDIT</th><th id=\"td5\">DELETE</th>
 </tr>
 <tr class="success" ng-repeat="Catagory in Catagory|filter:searchText">
 <td style="text-align: justify; font-size: large; color:silver;">{{Catagory.catagoryid}}</td>
 <td style="text-align: justify; font-size: large; color:silver;">{{Catagory.catagoryname}}</td>
 <td style="text-align: justify; font-size: large; color:silver;">{{Catagory.description}}</td>
<td><a href="editcatagory?id={{Catagory.catagoryid}}">Edit</a>
<td><a href="delcatagory?id={{Catagory.catagoryid}}">Delete</a></td></tr>
</table>
</div>
</div>
</div>
</form:form>
<jsp:include page="footer.jsp"/>
<script src="resources/js/bootstrap.js"></script>