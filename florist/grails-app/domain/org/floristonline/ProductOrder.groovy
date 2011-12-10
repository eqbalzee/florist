package org.floristonline

class ProductOrder {

	//static hasMany = [orderItem : OrderItem];
	Date orderDate;
	Date entryDate;
	OrderType orderType;
	Party orderPlacedBy;
	Party orderEnteredBy;
}
