package org.floristonline

class InvoiceItem {

	
	 
	ShipmentItem shipmentItem;
	Invoice invoice;
	InvoiceItemType InvoiceItemType;
	//static hasMany = [paymentApplication : PaymentApplication];
	char taxableFlag;
	int quantity;
	float unitPrice;
	float amount;
	String description;
	
	
}
