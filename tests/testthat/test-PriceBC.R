# Tests for the PriceBC function

test_that("Test correct calculations", {
  expect_equal(PriceBC("Restaurant", MealBill = 25, AlcoholBill = 10, Tip=10), c(37.75, 41.525))
  expect_equal(PriceBC(type="Restaurant", MealBill = 37.90, Tip=20), c(39.795, 47.754))
  expect_equal(PriceBC("Sale", PriceTag = 50), 56)
})


test_that("Test required input type", {
  expect_error(PriceBC("Restaurant", MealBill = "25"), 'non-numeric argument to binary operator')
  # MealBill - character input instead of numeric
  expect_error(PriceBC("Restaurant", MealBill = 25), 'argument "Tip" is missing, with no default')
  # Tip - Missing required argument
  expect_error(PriceBC("Bar", MealBill = 25), 'This function requires either "Restaurant" or "Sale" as first argument\nYou have provided: Bar')
  # type - Only allows 2 inputs (Restaurant OR Sale). NO other input is allowed.
})

test_that("Test output vector length", {
  expect_length(PriceBC("Restaurant", MealBill = 25, AlcoholBill = 35, Tip=18), 2)
  # Vector of length 2, where 1) price after taxes, 2) price after tip
  expect_length(PriceBC("Sale", PriceTag = 199), 1)
  # Vector of length 1, where 1) price after texes.
})
