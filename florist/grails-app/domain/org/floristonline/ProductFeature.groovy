package org.floristonline

import java.util.Date;

class ProductFeature {

	static hasMany = [priceComponent : PriceComponent, 
					  estimatedProductCost : EstimatedProductCost
					   ];
	
	String description;
	Date fromDate;
	Date thruDate;
	String product_Quality;
	String color;
	String unitOfMeasure;
	String size;
	
	
}
