# Load required libraries
install.packages("forecast")
library(tidyverse)
library(forecast)

# Load dataset
inventory_data <- read.csv("/Users/nithin/Downloads/Retail Inventory Data/Cleaned_Inventory_Data.csv")

# Convert Sales_Units column to numeric
inventory_data$Sales_Units <- as.numeric(inventory_data$Sales_Units)
inventory_data$Ordering_Cost <- as.numeric(inventory_data$Ordering_Cost)
inventory_data$Warehouse_Holding_Cost <- as.numeric(inventory_data$Warehouse_Holding_Cost)

# Handle missing values
inventory_data$Sales_Units[is.na(inventory_data$Sales_Units)] <- mean(inventory_data$Sales_Units, na.rm = TRUE)
inventory_data$Ordering_Cost[is.na(inventory_data$Ordering_Cost)] <- mean(inventory_data$Ordering_Cost, na.rm = TRUE)
inventory_data$Warehouse_Holding_Cost[inventory_data$Warehouse_Holding_Cost == 0] <- 0.01

# Aggregate Sales data by Product for Time Series Analysis
time_series_data <- inventory_data %>%
  group_by(Product) %>%
  summarise(Total_Sales = sum(Sales_Units, na.rm = TRUE))

# Convert to Time Series Object
ts_data <- ts(time_series_data$Total_Sales, frequency = 12)

# Forecasting with Exponential Smoothing
ets_model <- ets(ts_data)
n_forecast <- forecast(ets_model, h = 6) # Forecast for next 6 months
plot(n_forecast)

# Forecasting with ARIMA
arima_model <- auto.arima(ts_data)
arima_forecast <- forecast(arima_model, h = 6)
plot(arima_forecast)

# Economic Order Quantity (EOQ) Calculation
eoq_formula <- function(demand, ordering_cost, holding_cost) {
  sqrt((2 * demand * ordering_cost) / holding_cost)
}

inventory_data$EOQ <- mapply(eoq_formula, 
                             demand = inventory_data$Sales_Units * 12, 
                             ordering_cost = inventory_data$Ordering_Cost, 
                             holding_cost = inventory_data$Warehouse_Holding_Cost)

# Reorder Point Calculation
lead_time <- 2 # Assume a lead time of 2 months
safety_stock <- 0.2 * inventory_data$Sales_Units # Assuming 20% safety stock
inventory_data$Reorder_Point <- (inventory_data$Sales_Units * lead_time) + safety_stock

# Save results
write.csv(inventory_data, "optimized_inventory.csv", row.names = FALSE)