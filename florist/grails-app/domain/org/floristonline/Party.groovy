package org.floristonline

class Party {

    static hasMany = [partyRole : PartyRole, 
						contactMechanism : ContactMechanism 
						];
	
	
	String firstName;
	String lastName;
	String middleName;
	String currentPersonalTitle;
	String gender;
	Date birthDate;
	String maritalStatus;
	float totalWorkExperience;
	String socialSecurityNo;
	String comment;
	
	
}
