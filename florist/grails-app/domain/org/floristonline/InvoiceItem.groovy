package org.floristonline

class InvoiceItem {

	
	 
	ShipmentItem shipmentItem;
	Invoice invoice;
	InvoiceItemType InvoiceItemType;
	static hasMany = [payments : Payment];
	Payment payment;
	char taxableFlag;
	int quantity;
	float unitPrice;
	float amount;
	String description;
	
	
}
