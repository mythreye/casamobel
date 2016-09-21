<div class="container">
<div class="span12" style="200">
<table style="width: 100%">
<tr>
<td style="color: black;">
<div><img src="resources/img/coollogo_com-80891387.gif"/></div>
</td>
<td>
<%
    Integer hitsCount =(Integer)application.getAttribute("hitCounter");
    if( hitsCount ==null || hitsCount == 0 )
    {
       /* First visit */
      // out.println("Welcome to lootle.com!");
       hitsCount = 1;
    }
    else
    {
       /* return visit */
       //out.println("Welcome to lootle.com!");
       hitsCount += 1;
    }
    application.setAttribute("hitCounter", hitsCount);
%>
<center><p>Total number of visits: <%= hitsCount%></p></center>
</td>
<td>
    <ul class="list-social pull-right">
      <li><a class="icon-1" href="#"></a></li>
      <li><a class="icon-3" href="#"></a></li>
      <li><a class="icon-4" href="#"></a></li>
    </ul>
</td>
</tr>
</table>
</div>
</div>