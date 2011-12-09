package org.floristonline

class InvoiceItem {

	
	 
	ShipmentItem shipmentItem;
	
	InvoiceItemType InvoiceItemType;
	//static hasMany = [paymentApplication : PaymentApplication];
	char taxableFlag;
	int quantity;
	float unitPrice;
	float amount;
	String description;
	
	
}
