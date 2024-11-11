# Case Study: Global Product Performance and Sentiment Analysis for StellarTech Inc.
**Database**: `StellarTech_Inc_db`

![Home Page]([https://github.com/frankie323/assets/blob/main/StellarTech%20-%20Homepage.png])

## Company Overview

StellarTech Inc. is a global technology and electronics company that specializes in consumer electronics. The company delivers high-quality products across various segments, including smartphones, laptops, and home appliances. With a presence in over 15 countries, StellarTech aims to gain insights into its product performance in different regions to optimize its global strategy.

## Objective

This case study aims to analyze the performance of StellarTech's products by examining year-over-year (YoY) trends, units sold, revenue, and customer sentiment across various countries. StellarTech aims to use these insights to make data-driven decisions to improve sales, customize products to meet regional preferences, and enhance customer satisfaction.

## Data Sources

1 Date Table
  - Columns: Date, Month No, Month Name, Quarter, Year, In Range
  - Purpose: To support time-based analyses, such as monthly and quarterly trends, YoY, and Year-to-Go (YTG) calculations.
2 Geography Table
  - Columns: Zip Code, City, State, Region, District, Country
  - Purpose: Provides regional data, allowing analysis by city, state, and country to uncover geographic performance trends.
3 Product Table
  - Columns: ProductID, Product Name, Category, Segment, Manufacturer
  - Purpose: Describes each product with details like category, segment, and manufacturer, enabling insights by product type and supplier.
4 Sales Table
  - Columns: Date, Units, Revenue, Country
  - Purpose: Contains transactional sales data, including units sold and revenue for each date and country, essential for tracking overall sales performance.
5 Sentiment Table
  - Columns: StateID, Score, Date, Product
  - Purpose: Captures customer sentiment scores for products, allowing analysis of customer satisfaction trends across states and product categories.

![Data Model]([https://github.com/frankie323/assets/blob/main/Tables.png])

## Analysis Approach

### 1 Year-Over-Year (YoY) Sales Performance

  - Goal: To determine growth rates in sales and revenue YoY, enabling StellarTech to evaluate performance trends across regions and product segments.
  - Method: Calculated YoY percentage change in units sold and revenue by comparing each year’s performance data.
  - Insights: Uncovered that StellarTech’s flagship smartphone line grew by 18% YoY in the North American market, while other segments like home appliances showed a 5% decline in revenue across Europe. This suggested strong demand for premium tech products but a need to reassess the marketing strategy for appliances in Europe.

### 2 Year-to-Go (YTG) Analysis

  - Goal: Track progress toward annual sales and revenue targets.
  - Method: YTG was calculated by taking the difference between the annual target and current YTD performance. The metric was displayed as a percentage of the remaining goal to simplify tracking.
  - Insights: By October, StellarTech had achieved 82% of its annual revenue target in APAC, with three months remaining. This prompted additional marketing efforts in underperforming regions like South America, which lagged at 65% of the YTG target.

### 3 Units Sold Analysis

  - Goal: Identify demand trends for StellarTech products across different timeframes and regions.
  - Method: Monthly, quarterly, and annual unit sales were aggregated to identify sales patterns.
  - Insights: The analysis revealed that the “EcoSmart” laptop series was a top performer in North America and APAC, with peak sales occurring in Q2 and Q3, likely due to back-to-school season demand. Meanwhile, the “HomeEase” appliance line performed better during the holiday season in Europe, with a significant 30% increase in units sold in December compared to other months.

### 4 Revenue Trends Analysis

  - Goal: Examine revenue trends for each product and region to determine high-value markets and product categories.
  - Method: Revenue was aggregated by month, quarter, and product category, with comparisons across regions to highlight discrepancies.
  - Insights: Revenue from StellarTech’s premium smartphone models surged in APAC, contributing to 45% of the total regional revenue. On the contrary, revenue from these models remained stagnant in South America. This disparity prompted StellarTech to reconsider its pricing strategy and promotional campaigns in South America to boost interest in high-value models.

### 5 Sentiment Analysis

  - Goal: Assess customer sentiment on StellarTech’s products across regions to gain insights into customer satisfaction and areas needing improvement.
  - Method: Sentiment scores were averaged by product category and region, then compared over time to identify shifts in customer perception.
  - Insights: The sentiment analysis revealed consistently high satisfaction scores (averaging 4.5 out of 5) for the “EcoSmart” laptop series in North America. However, the “SmartHome” product line received lower sentiment scores (averaging 3.2) in Europe, with complaints around installation and user support. The findings led to prioritizing customer support improvements for the “SmartHome” line in Europe.

### 6 Product Performance by Segment and Manufacturer

  - Goal: Determine which product segments and manufacturers contributed most to StellarTech’s sales and satisfaction.
  - Method: Sales and sentiment data were analyzed by segment (e.g., premium, budget) and manufacturer to evaluate performance and satisfaction across different product tiers.
  - Insights: Premium products contributed 65% of total revenue and had higher sentiment scores than budget models, indicating a strong preference among customers for premium-quality products. The findings suggested that StellarTech could benefit from further investment in the premium segment, with additional marketing for specific budget models that performed well in emerging markets.

![Dashboard]([https://github.com/frankie323/assets/blob/main/StellarTech%20-%20Dashboard.png])

## Key Findings and Recommendations

### 1 Focus on the APAC Market
 - The APAC market is experiencing strong growth in premium smartphone sales, along with positive customer sentiment. StellarTech should consider increasing its marketing budget in this region to capitalize on this momentum, especially for new product launches.

### 2 Optimize Marketing in South America
 - Due to low year-to-go (YTG) progress and stagnant revenue for premium models in South America, StellarTech could explore region-specific promotions and adopt a more competitive pricing strategy to boost demand.

### 3 Improve Customer Support for Smart Home Products in Europe
- Customer feedback regarding the Smart Home line in Europe indicates dissatisfaction with support and installation services. Enhancing customer support and providing clear setup guides could address these issues, potentially improving both sales and customer sentiment.

### 4 Enhance Global Marketing for the Premium Segment
- Premium products generate higher revenue and sentiment scores. Therefore, StellarTech should reinforce its brand positioning around quality and exclusivity. Regional campaigns that emphasize product quality and long-term value may enhance brand perception and drive sales.

## Conclusion
This case study provides a comprehensive overview of StellarTech Inc.’s product performance, with insights into regional sales trends, revenue drivers, and customer satisfaction. By addressing identified opportunities and challenges, StellarTech can fine-tune its global strategy, improve customer satisfaction, and maximize profitability across diverse markets.

![Ratings Page]([https://github.com/frankie323/assets/blob/main/StellarTech%20-%20Ratings%20Page.png])
