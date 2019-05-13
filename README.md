## How to run
ruby main.rb (Lists some scenarios)

### The solution consists of the following classes
- Product 
- Checkout - takes in a Array of Pricing rules and applies each one of them serially and gets discount and hence returns total price.
- PricingRules
    -  BulkDiscount ( the brand new Super iPad will have a bulk discounted applied, where the price will drop to $499.99 each, if someone buys more than 4)
    -  XFreeWhenYPurchasedDeal (we will bundle in a free VGA adapter free of charge with every MacBook Pro sold)
    - XItemsForYPriceDeal - (we're going to have a 3 for 2 deal on Apple TVs. For example, if you buy 3 Apple TVs, you will pay the price of 2 only
- ProductCatalogue - reads from a csv file of products


## Approach 

- I created different classes for each of the Pricing Rule given in the problem. 
- Each of the classes are parametarized. So a 3 for 2 deal for Appple TV can be changed to 5 for 3 deal for Macbooks and so on
- As each Pricing Rule is a different class, then additional classes can be added for new Pricing Rule. 

#### checkout_spec.rb is the integartion test, I have tested various scenarios
## Things I am proud of
 
- I have written a lot of cases. 
- I believe this is fairly extensible solution.
- Classes have Single Responsibility. I have used composition vs Inhelitance.
- Small classes, small methods.
- there is a good domain to class mapping.
- Its extensible - The classes created can be used to apply wide variety of offers, and any new offer can be created as a new class which has to implement an apply method. 

## Possible Improvements
- Exception handling
- Test with lot of Invalid products
- More integration tests. 
- When different pricing rules apply to same ste of products, the total may not be correct
- Handling of only one offer in a checkout 
- I believe product_catalogue should also be passed into the Checkout class in the initializer, then skus can be scanned instead of scanning product object, current implementation can be easily extended for this. I did not implement this as I wanted to adhere to interface provided in the problem 

```
Checkout
  #total
    when 2 products are scanned and no discounts
      expect product total to be total of products scanned
    when 3 for 2 deal is applicable for Apple Tvs
      expect total for only 2 atvs
    when bulk discount and 3 for 2 is applicable
      expect price of ipad to drop to 499.00 and 3 for 2 offer apply
    when free products deal is applicable
      expect price of ipad to drop to 499.00 and vgas to be free

BulkDiscount
  #apply
    buy more than 4 ipads, and pay $499 each only
      when 4 ipads are bought
        expected to return correct discount
      when 2 ipads are bought
        expected to return correct discount

XFreeWhenYPurchasedDeal
  #free_products
    free vga when macbookpro purchased
      when 1 macbookpro is bought
        expected to return correct product and discount
      when 3 macbookpros are bought
        expected to return correct product and discount

XItemsForYPriceDeal
  #apply
    3 for 2 deal on ipads
      when 3 ipads are bought
        expected to return correct discount
      when 7 ipads are bought
        expected to return correct discount
      when 2 ipads are bought
        expected to return correct discount

ProductCatalogue
  #find
    sku in the product catalogue
      should return nil
    sku not in the product catalogue
      should return valid product

Product
  #sku
    expected to return sku
  #name
    expected to return name
  #price
    expected to return price

Finished in 0.00905 seconds (files took 0.13028 seconds to load)
16 examples, 0 failures

```
