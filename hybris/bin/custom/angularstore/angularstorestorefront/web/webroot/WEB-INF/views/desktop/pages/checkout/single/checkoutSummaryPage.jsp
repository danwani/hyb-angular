<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/desktop/template" %>
<%@ taglib prefix="cart" tagdir="/WEB-INF/tags/desktop/cart" %>
<%@ taglib prefix="checkout" tagdir="/WEB-INF/tags/desktop/checkout" %>
<%@ taglib prefix="single-checkout" tagdir="/WEB-INF/tags/desktop/checkout/single" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/desktop/common" %>

<spring:url value="/checkout/single/placeOrder" var="placeOrderUrl" />
<spring:url value="/checkout/single/termsAndConditions" var="getTermsAndConditionsUrl" />


<template:page pageTitle="${pageTitle}">

	<script type="text/javascript">
		var getTermsAndConditionsUrl = "${getTermsAndConditionsUrl}";
	</script>
	
	<div id="breadcrumb" class="breadcrumb"></div>

	<div id="globalMessages">
		<common:globalMessages/>
	</div>



	<div class="span-24">

		<div class="span-24">
			<single-checkout:summaryFlow />
		</div>

		<div class="span-24 last place-order-top">
			<form:form action="${placeOrderUrl}" id="placeOrderForm1" commandName="placeOrderForm">
				<form:input type="hidden" class="securityCodeClass" path="securityCode"/>
				<button type="submit" class="positive right pad_right place-order placeOrderWithSecurityCode">
					<spring:theme code="checkout.summary.placeOrder"/>
				</button>
				<dl class="terms right">
					<dt class="left">
						<form:checkbox id="Terms1" path="termsCheck" />
						<label for="Terms1"><spring:theme code="checkout.summary.placeOrder.readTermsAndConditions"/></label>
					</dt>
					<dd></dd>
				</dl>
			</form:form>
		</div>

		<div class="span-24">
			<checkout:summaryCartItems cartData="${cartData}" />
		</div>

		<div class="span-16">
			<cart:cartPromotions cartData="${cartData}"/>
		</div>

		<div class="span-8 right last place-order-cart-total">
			<cart:ajaxCartTotals/>
		</div>

		<div class="span-24 place-order-bottom">
			<form:form action="${placeOrderUrl}" id="placeOrderForm2" commandName="placeOrderForm">
				<form:input type="hidden" class="securityCodeClass" path="securityCode"/>
				<button type="submit" class="positive right pad_right place-order placeOrderWithSecurityCode">
					<spring:theme code="checkout.summary.placeOrder"/>
				</button>
				<dl class="terms right">
					<dt class="left">
						<form:checkbox id="Terms2" path="termsCheck" />
						<label for="Terms2"><spring:theme code="checkout.summary.placeOrder.readTermsAndConditions"/></label>
					</dt>
					<dd></dd>
				</dl>
			</form:form>
		</div>
	</div>
	
	<cms:pageSlot position="SideContent" var="feature" element="div" class="span-24 side-content-slot cms_disp-img_slot">
		<cms:component component="${feature}"/>
	</cms:pageSlot>
</template:page>