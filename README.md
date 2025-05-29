# 📦 Retail Inventory Optimization Using Forecasting & EOQ

This project leverages time series forecasting and inventory theory to optimize product stock levels in a retail setting. By combining Exponential Smoothing, ARIMA models, and Economic Order Quantity (EOQ) calculations, the solution helps reduce costs associated with overstocking and stockouts.

---

## 🔍 Problem Statement

Retailers often struggle to maintain the right inventory balance. This project addresses:
- How much to order (EOQ)
- When to reorder (ROP)
- How to forecast demand for each product over time

---

## 📦 Dataset

**Files Used**:
- `Cleaned_Inventory_Data.csv`: Includes product names, monthly sales, ordering costs, and holding costs
- `Model Sample Data - Retail Inventory.xlsx`: Reference for demand trends
- `optimized_inventory.csv`: Output file with calculated EOQ and ROP

---

## 🛠️ Tools & Technologies

- **R**
- `tidyverse` – data wrangling  
- `forecast` – time series modeling  
- Tableau – dashboard visualizations  
- `mapply`, `ARIMA`, `ETS`, and custom functions for EOQ/ROP logic

---

## ⚙️ How It Works

### 1. Data Cleaning & Preparation
- Converted cost and unit fields to numeric
- Replaced `NA` and zero holding costs with mean/imputed values

### 2. Time Series Forecasting
- Aggregated sales by product
- Applied:
  - `ETS` (Exponential Smoothing) for seasonality-based forecasting
  - `ARIMA` for trend detection and forecasting
- Forecast horizon: 6 months

### 3. Inventory Modeling

**EOQ (Economic Order Quantity):**
\[
EOQ = \sqrt{\frac{2 \times \text{Annual Demand} \times \text{Ordering Cost}}{\text{Holding Cost}}}
\]

**Reorder Point (ROP):**
\[
ROP = (\text{Monthly Demand} \times \text{Lead Time}) + \text{Safety Stock}
\]

- Lead Time: 2 months  
- Safety Stock: 20% of monthly demand  

### 4. Output & Export
- EOQ and ROP values appended to dataset
- Saved as `optimized_inventory.csv` for reporting

---

## 📈 Results

- 📉 Demand trends visualized using ETS and ARIMA  
- ✅ EOQ and ROP metrics calculated per product  
- 💾 Output stored in a structured CSV for downstream use  

---

## 📊 Tableau Dashboard Highlights

- Forecasted sales trends  
- Inventory cost comparisons  
- EOQ distribution across products  
- ROP threshold alerts  

---

## ✅ Business Value

- 🚚 Reduces excess inventory and associated holding costs  
- 🕒 Improves reorder timing to prevent stockouts  
- 💸 Supports lean operations with just-in-time stock planning  

---

## 🚀 Future Work

- 📊 Integrate real-time POS data streams for dynamic updates  
- 📦 Incorporate supplier lead time variability  
- 🤖 Automate dashboard refreshes and alerting  
- 🧠 Extend EOQ logic to consider discount pricing models

---

## 👨‍💻 Author

**Nithin Sai Adru**  
📧 nithin.adru@email.ucr.edu  

---
