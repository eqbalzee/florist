package org.floristonline

class ProductOrder {

	static hasMany = [orderItem : OrderItem];
	Date orderDate;
	Date entryDate;
	String orderType;
	Party orderPlacedBy;
	Party orderEnteredBy;
}
