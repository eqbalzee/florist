package org.floristonline

class OrderItem {

	//static hasMany = [shipmentItem : ShipmentItem];
	ProductOrder productOrder;
	Product product;
	ContactMechanism contactMechanism;
	float quantity;
	//float unitPrice;
	Date estimatedDeliveryDate;
	String shippingInstructions;
	String itemDescription;
	String comment;
	
	def orderItemPrice() {
		
		def totalCost = 0;
		totalCost = quantity*product.priceComponent()
		return totalCost;
	}
	
	
}
