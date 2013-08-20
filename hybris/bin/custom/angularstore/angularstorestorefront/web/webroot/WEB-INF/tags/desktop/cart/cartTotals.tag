<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ attribute name="cartData" required="true" type="de.hybris.platform.commercefacades.order.data.CartData" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/desktop/template" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme" %>
<%@ taglib prefix="format" tagdir="/WEB-INF/tags/shared/format" %>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<div class="item_container_holder">
	<div class="title_holder">
		<h2><spring:theme code="order.order.totals" /></h2>
	</div>
	<div class="item_container" id="order_totals_container">
		<div class="information_message negative hidden" id="selectAValidZipCode"  tabindex="0">
    		<span class="single"></span>
    		<p><spring:theme code="basket.page.totals.error.wrongzipcode"/></p>
    	</div>
    	<div class="information_message negative hidden" id="selectAValidCountry"  tabindex="0">
            <span class="single"></span>
            <p><spring:theme code="basket.page.totals.error.wrongcountry"/></p>
        </div>
		<dl class="order_totals">
			<dt><spring:theme code="basket.page.totals.subtotal"/></dt>
			<dd><ycommerce:testId code="Order_Totals_Subtotal"><format:price priceData="${cartData.subTotal}"/></ycommerce:testId></dd>
			<c:if test="${cartData.totalDiscounts.value > 0}">
				<dt class="savings"><spring:theme code="basket.page.totals.savings"/></dt>
				<dd class="savings"><ycommerce:testId code="Order_Totals_Savings"><format:price priceData="${cartData.totalDiscounts}"/></ycommerce:testId></dd>
			</c:if>
			<c:if test="${not empty cartData.deliveryCost}">
				<dt><spring:theme code="basket.page.totals.delivery"/></dt>
				<dd>
					<format:price priceData="${cartData.deliveryCost}" displayFreeForZero="TRUE"/>
				</dd>
			</c:if>

			<c:if test="${cartData.net}">

			<div class="clearfix"></div>
				<div id="countryWrapperDiv" class="clearfix">
				<dt class="form_field-label"><spring:theme code="basket.page.totals.deliverycountry"/></dt>
				<dd id="estimatedCountry" class="total"><select id="countryIso" >
				<option value="" disabled="disabled" selected="selected"><spring:theme code='address.selectCountry'/></option>
				<c:forEach var="country" items="${supportedCountries}">
					<option value="${country.isocode}">${country.name}</option>
				</c:forEach>
				</select>
				</dd>
				</div>

				<div id="zipCodewrapperDiv" class="clearfix">
					<dt class="form_field-label"><spring:theme code="basket.page.totals.estimatedZip"/></dt>
					<dd><input id="zipCode" value="" class="form_field-input" size="15"/>
					<button id="estimateTaxesButton" class="form"><spring:theme code="basket.page.totals.estimatetaxesbutton"/></button></dd>
				</div>

				<dt class="hidden estimatedTotals"><spring:theme code="basket.page.totals.estimatedtotaltax"/></dt>
				<dd id="estimatedTotalTax" class="hidden estimatedTotals" >
						<format:price priceData="${cartData.totalTax}"/>
				</dd>
				<dt class="total hidden estimatedTotals"><spring:theme code="basket.page.totals.estimatedtotal"/></dt>
                <dd id="estimatedTotalPrice" class="total hidden estimatedTotals">
                   	<format:price priceData="${cartData.totalPrice}"/>
                </dd>
    		</c:if>

			<dt class="total realTotals"><spring:theme code="basket.page.totals.total"/></dt>
			<dd id="totalPrice" class="total realTotals">
				<ycommerce:testId code="cart_totalPrice_label">
					<format:price priceData="${cartData.totalPrice}"/>
				</ycommerce:testId>
			</dd>
		</dl>

		<c:if test="${not cartData.net}">
			<div class="realTotals">
				<ycommerce:testId code="cart_taxes_label">
					<p><spring:theme code="basket.page.totals.grossTax" arguments="${cartData.totalTax.formattedValue}" argumentSeparator="!!!!" /></p>
				</ycommerce:testId>
			</div>
		</c:if>
		<c:if test="${cartData.net}">
			<div class="realTotals">
				<ycommerce:testId code="cart_taxes_label">
					<p><spring:theme code="basket.page.totals.noNetTax" /></p>
				</ycommerce:testId>
			</div>
		</c:if>
	</div>
</div>
