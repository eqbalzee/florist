package org.floristonline

class Product {

	
	static hasMany = [productCategories: ProductCategory];
    String name;
	byte[] image;
	Date introductionDate;
	Date salesDiscontinuationDate;
	String comment;
	//ProductFeatureApplicability productFeatureApplicability
	
	def estimatedProductCost() {
		def estimatedProductCost = EstimatedProductCost.findAllByProduct(this)
		def totalCost = 0;
		estimatedProductCost.each {EstimatedProductCost productCost ->
			totalCost += productCost.cost
			
		}
		return totalCost
	}
	
	def priceComponent() {
		def priceComponent = PriceComponent.findAllByProduct(this)
		def totalCost = 0;
		priceComponent.each {PriceComponent productCost ->
			
			if(productCost.priceComponentType.description != "Discount")
			{
				totalCost += productCost.price
			} else {
				totalCost -= totalCost*productCost.price/100
			}
		}	
		return totalCost
	}
}
