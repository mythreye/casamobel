<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<<style>
@import url(http://fonts.googleapis.com/css?family=Open+Sans:400,300italic,600);
h1, h3 {
  font-family: 'Open Sans', Helvetica, Arial, sans-serif;
  font-weight:900;
  text-align:center;
  font-size:30px;
  color:#e0ef53;
}
a
{
	color:#f76183;
	text-decoration:none;
}
.container {
  width:360px;
  margin:0 auto;
  position:relative;
  perspective:800;
  -webkit-perspective:800;
  -moz-perspective:800;
}
.theCard {
  width:100%;
  height:100%;
  position:absolute;
  -webkit-transition: -webkit-transform 1s;
  transition: transform 1s;
  -webkit-transform-style: preserve-3d;
  transform-style: preserve-3d;
}
figure {
  display: block;
  position: absolute;
  min-height:175px;
  width:330px;
  -webkit-backface-visibility:hidden;
  backface-visibility:hidden;
}

.theCardFront,
.theCardBack{
	background-image:url(http://i.imgur.com/91tA0B7.png);
	
	  border-radius:5px;
	  background-repeat: no-repeat;
    background-attachment:fixed;
    background-position: center;
  font-family: 'Open Sans', Helvetica, Arial, sans-serif;
  margin:0 auto;
  color:#444;
  border-radius:10px;
  padding:15px;
  background-size:100%;
  
}

input {
  font-size:1em;
  padding:.15em;
  text-align:center;
  outline:none;
}
.cardNumber input{
  width:95%;
  height:30px;
  margin:.75em .05em;
  border:1px solid #d1c7ac;
	border-radius:5px;
	color:#333333; 
	background: linear-gradient(#eee, #fff);
}

.csc {
  width:22%;
  height:28px;
  margin:.75em .05em;
  border:1px solid #d1c7ac;
	border-radius:5px;
	color:#333333;
	background: linear-gradient(#eee, #fff);
  
}

select
{
	width:90px;
	height:35px;
  margin:.75em .05em;
  border:1px solid #d1c7ac;
	border-radius:5px;
	color:#333333; 
	background: linear-gradient(#eee, #fff);
}
.visacardImg
{
	background-position:right;
	background-image:url(http://i.imgur.com/UyVQT8u.png);
	background-repeat:no-repeat;
}
</style>

<jsp:include page="header.jsp"/>
  <br/><br/><br/><br/>
  <form action="placeorder">
 <div class="container" style="min-height: 700px;">
    <div class="theCard">
      <figure class="theCardFront">
    	<div class="instructionsCards">
        	<div class="variousCards"> 
            	<div class="visacardImg"><font color="#FFFFFF"><span>Payment details</span></font></div>
            </div>
        </div>      	
        <br class="clear" />
        <div class="cardNumber"><font color="#f7f8f6" size="-1">CARD NUMBER</font><br/>
            <input class="firstfour" input placeholder="enter 16 digit code" maxlength="16" />
            
        </div>
        <div class="cardExpiration"><font color="#f7f8f6" size="-1">EXPIRATION</font><br/>
        	<select>
  				<option value="volvo">month</option>
  				<option value="saab">jan</option>
  				<option value="mercedes">feb</option>
  				<option value="audi">mar</option>
  				<option value="volvo">apr</option>
        	  <option value="saab">may</option>
        	  <option value="mercedes">jun</option>
        	  <option value="audi">jul</option>
              <option value="volvo">aug</option>
        	  <option value="saab">sep</option>
        	  <option value="mercedes">oct</option>
        	  <option value="audi">nov</option>
              <option value="volvo">dec</option>
			</select>
       	  <select name="select">
        	  <option value="volvo">year</option>
        	  <option value="saab">2015</option>
        	  <option value="mercedes">2016</option>
        	  <option value="audi">2017</option>
              <option value="volvo">2018</option>
        	  <option value="saab">2019</option>
        	  <option value="mercedes">2020</option>
          </select>
          <span class="cardSecurity">
                      <input class="csc" placeholder="CVC" maxlength="3"/>
        </span>
       </div>
       <br/>
       <div align="center"><input type="submit"/></div>
   </div>
</div>
</form>

  <script src="resources/js/bootstrap.js"></script>
 