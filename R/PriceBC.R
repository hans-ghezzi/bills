#' @title Calculate bills after taxes and tips
#'
#' @description Calculates the additional costs of taxes and tips when buying in the food and retail services in British Columbia, Canada.
#'
#' @param type Character vector defining the type of service, food or retail. Taxes and tips apply differently to each service. Requires "Restaurant" or "Sale" as argument input.
#' @param PriceTag Numeric vector indicating the cost of products to buy in the retail service, before taxes.
#' @param MealBill Numeric vector indicating the cost of food and non-alcoholic beverages in the food service, before taxes.
#' @param AlcoholBill Numeric vector indicating the cost of alcoholic beverages, before taxes.
#' @param Tip Numeric vector indicating the percentage of the total bill to give as tip.
#' @return A vector displaying the final bill after taxes and after tip.
#'
#' @examples
#' PriceBC("Sale", PriceTag = 50)
#' PriceBC("Restaurant", MealBill = 35, AlcoholBill = 67, Tip = 18)
#'
#' @export


PriceBC <- function(type, PriceTag, MealBill, AlcoholBill, Tip) {

  if(!type %in% c("Restaurant", "Sale")) {
    stop('This function requires either "Restaurant" or "Sale" as first argument\n',
         'You have provided: ', type)
  }

  if(type == "Restaurant") {

    if(missing(AlcoholBill)) {
      TaxBill <- (MealBill*1.05)
      FinalBill <- TaxBill + (TaxBill * (Tip/100))
      print(paste("The bill after taxes is: $", TaxBill, sep=""))
      print(paste("The bill after taxes and tip is: $", FinalBill, sep = ""))
      return(c(TaxBill, FinalBill))
    }
    if(missing(MealBill)) {
      TaxBill <- (AlcoholBill*1.15)
      FinalBill <- TaxBill + (TaxBill * (Tip/100))
      print(paste("The bill after taxes is: $", TaxBill, sep=""))
      print(paste("The bill after taxes and tip is: $", FinalBill, sep = ""))
      return(c(TaxBill, FinalBill))
    }
    else {
      TaxBill <- (MealBill*1.05) + (AlcoholBill*1.15)
      FinalBill <- TaxBill + (TaxBill * (Tip/100))
      print(paste("The bill after taxes is: $", TaxBill, sep=""))
      print(paste("The bill after taxes and tip is: $", FinalBill, sep = ""))
      return(c(TaxBill, FinalBill))
    }
  }

  if(type == "Sale") {
    SaleBill <- PriceTag * 1.12
    print(paste("The bill after taxes is: $", SaleBill, sep=""))
    return(SaleBill)
  }
}
