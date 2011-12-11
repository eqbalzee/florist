package org.floristonline

class Payment {

	//static hasMany = [invoice : Invoice];
	PaymentMethodType paymentMethodType;
	Party payerParty;
	Party receiverParty;
	Date effectiveDate;
	int paymentRefNum;
	float amount;
	String comment;
}
