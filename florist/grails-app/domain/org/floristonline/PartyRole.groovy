package org.floristonline

class PartyRole {

	static hasMany = [orderItem : OrderItem];
	
	String name;
	Date fromDate;
	Date thruDate;
}
