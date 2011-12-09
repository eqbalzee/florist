package org.floristonline

class ContactMechanism {

	//static hasMany = [orderItem : OrderItem, shipment : Shipment];
	String address;
	String city;
	String state;
	String zipCode;
	String phoneNo;
	String cellPhone;
	String email;
	@Override
	public String toString() {
		return "Contact Address [address=" + address + ", city=" + city
				+ ", state=" + state + ", zipCode=" + zipCode + ", phoneNo="
				+ phoneNo + ", cellPhone=" + cellPhone + ", email=" + email
				+ "]";
	}
	
	static constraints = {
		email(email:true)
	}
	

	
}
