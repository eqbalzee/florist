package org.floristonline

class BillingAccount {

    static hasMany = [paymentApplication : PaymentApplication];
	
	BillingAccountRole billingAccountRole;
	String description;
	Date fromDate;
	Date thruDate;
	ContactMechanism billedAt;
}
