package org.floristonline

class Shipment {

	
	ShipmentType shipmentType;
	Party shippedToParty;
	Party shippedFromParty;
	Date estimatedShipDate;
	Date estimatedReadyDate;
	Date estimatedArrivalDate;
	float estimatedShipCost;
	float actualShipCost;
	Date latestCancelDate;
	String handlingInstructions
	Date lastUpdated;
	ContactMechanism shippedToContactMechanism;
	ContactMechanism shippedFromContactMechanism;
	
}
