<tr class="${counter%2==0?'even':'odd' } ${cssClass}">
	<td class="middle center">
		<g:checkBox id="${inventoryItem?.product?.id }" name="product.id" 
			class="checkbox" style="top:0em;" checked="${false }" 
				value="${inventoryItem?.product?.id }" />
	</td>																
	
	<td class="checkable center middle">
		<img src="${resource(dir: 'images/icons/inventoryStatus', file: inventoryItem?.inventoryLevel?.status?.name()?.toLowerCase() + '.png')}" 
			alt="${inventoryItem?.inventoryLevel?.status?.name() }" title="${inventoryItem?.inventoryLevel?.status?.name() }" style="vertical-align: middle;"/>
	</td>
	<td class="checkable middle">
		<g:link controller="inventoryItem" action="showStockCard" params="['product.id':inventoryItem?.product?.id]" fragment="inventory" style="z-index: 999">
			<g:if test="${inventoryItem?.product?.name?.trim()}">
				<format:product product="${inventoryItem?.product}"/> 
			</g:if>
			<g:else>
				<warehouse:message code="product.untitled.label"/>
			</g:else>
		</g:link> 
	</td>
	<td class="checkable middle center" style="width: 20%">
		<span class="fade">${inventoryItem?.product?.manufacturer }</span>
	</td>
	<td class="checkable middle center" style="width: 7%; border-left: 1px solid lightgrey;">
		<g:if test="${inventoryItem?.supported }">																
			${inventoryItem?.quantityToReceive?:0}
		</g:if>
		<g:else>
			<span class="fade"><warehouse:message code="default.na.label"/></span>																
		</g:else>
	</td>
	<td class="checkable middle center" style="width: 7%; border-right: 1px solid lightgrey;">
		<g:if test="${inventoryItem?.supported }">																
			${inventoryItem?.quantityToShip?:0}
		</g:if>
		<g:else>
			<span class="fade"><warehouse:message code="default.na.label"/></span>																
		</g:else>
	</td>
	<td class="checkable middle center" style="width: 7%;">
		<g:if test="${inventoryItem?.supported }">																
			<g:link controller="inventoryItem" action="showStockCard" params="['product.id':inventoryItem?.product?.id]">
				${inventoryItem?.quantityOnHand?:0}
			</g:link>
		</g:if>
		<g:else>
			<span class="fade"><warehouse:message code="default.na.label"/></span>																
		</g:else>
	</td>
</tr>