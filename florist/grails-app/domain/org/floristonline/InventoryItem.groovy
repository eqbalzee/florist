package org.floristonline

class InventoryItem {

	static hasMany = [invoiceItem : InvoiceItem];
	//fields of lot table
   // Date creationDate;
	//int quantity;
	//Date expirationDate;
}
