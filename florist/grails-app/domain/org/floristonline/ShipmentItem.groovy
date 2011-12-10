package org.floristonline

class ShipmentItem {

	//static hasMany = [orderItem : OrderItem];
	//static belongsTo = OrderItem;
	//Product product;
	Shipment shipment;
	OrderItem orderItem;
	//ShipmentStatus shipmentStatus;
    int quantity;
	String shipmentContentsDescription;
	
	def shipmentItemPrice() {
		
		def totalCost = 0;
		totalCost = quantity*orderItem.product.priceComponent()
		return totalCost;
	}
	
}
