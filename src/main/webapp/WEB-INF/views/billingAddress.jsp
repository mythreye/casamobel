<%@include file="header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="container" style="min-height: 700px;">
      <div class="row">
        <article class="span8">
          <h3>Contact us</h3>
          <div class="inner-1">
            <form:form action="checkout" commandName="Address">
                <div>
                  <label class="name">
                    <form:input path="name" type="text"  palceholder="Your name"/>
                </div>
                <div>
                  <label class="phone">
                    <form:input  path="number" type="text"  palceholder="Your number"/>
                </div>
                <div>
                  <label class="email" path="email">
                    <form:input type="email" path="email" palceholder="Your emailid"/>
                </div>
                <div>
                  <label class="message">
                    <form:textarea path="address"/>
                    <br>
                    <span class="error">*The message is too short.</span> <span class="empty">*This field is required.</span> </label>
                </div>
                <div class="buttons-wrapper"><input type="submit" value="Confirm Order"/></div>
              </fieldset>
            </form:form>
          </div>
        </article>
<%@include file="footer.jsp"%>	