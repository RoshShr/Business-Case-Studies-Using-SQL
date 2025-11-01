# Danny's Diner Case Study

## Overview
This repository contains a case study analyzing customer behavior and sales data for a fictional restaurant chain, **Danny's Diner**. The goal is to derive insights into customer purchasing patterns, membership effects, and product popularity through SQL queries applied to the provided database.

## Database Structure

The database consists of the following tables:

- **sales**: Tracks customer purchases, including columns for customer ID, order date, and product ID.
- **menu**: Contains the product details, including product ID, name, and price.
- **members**: Records the date customers joined the membership program, with customer ID and join date.

## Key Business Findings

### 1. **Total Amount Spent by Each Customer**
   - **Finding**: Customer A spent the most at the diner ($72), followed by customer B ($56) and customer C ($48).
   - This reveals the importance of targeting high-spending customers for personalized offers or loyalty rewards.

### 2. **Number of Days Each Customer Visited**
   - **Finding**: Customer A visited the diner 7 different days, customer B visited 6 days, and customer C visited 3 days.
   - High-frequency visitors such as customer A may indicate strong customer loyalty, which can be leveraged with VIP programs or targeted promotions.

### 3. **First Item Purchased by Each Customer**
   - **Finding**: 
     - Customer A's first item was **Sushi** (product ID 1).
     - Customer B's first item was **Curry** (product ID 2).
     - Customer C's first item was **Ramen** (product ID 3).
   - These first purchases can inform marketing strategies—new customers may be encouraged to try higher-margin or more popular items early on.

### 4. **Most Purchased Item on the Menu**
   - **Finding**: **Ramen** (product ID 2) was the most purchased item across all customers, followed by **Curry** and **Sushi**.
   - This insight helps prioritize popular items in promotions and inventory management. Curry, being the most popular, might be positioned as the flagship item for marketing campaigns.

### 5. **Most Popular Item for Each Customer**
   - **Finding**:
     - Customer A's most popular item was **Ramen** (product ID 3), with 3 purchases.
     - Customer B's most popular item was **Sushi** (product ID 1), with 3 purchases.
     - Customer C's most popular item was **Ramen** (product ID 3), with 3 purchases.
   - Personalizing offers based on individual preferences could increase customer engagement and sales. For instance, offering discounts or promotions for ramen to customers who prefer it.

### 6. **First Item Purchased After Becoming a Member**
   - **Finding**:
     - Customer A purchased **Ramen** (product ID 3) on the first day they became a member.
     - Customer B purchased **Sushi** (product ID 3) after joining the membership.
   - Membership seems to drive purchases of specific items, suggesting that certain products may have a stronger association with the loyalty program.

### 7. **Last Item Purchased Before Becoming a Member**
   - **Finding**:
     - Customer A's last item before membership was **Curry** (product ID 2).
     - Customer B's last item before membership was **Sushi** (product ID 3).
   - Understanding the products bought before joining the membership program can help target users with relevant items once they join. This insight could drive strategies for attracting customers to membership through promotions on their preferred items.

### 8. **Total Items and Amount Spent Before Becoming a Member**
   - **Finding**: 
     - Customer A purchased 2 items and spent $25 before becoming a member.
     - Customer B purchased 3 items and spent $40 before joining.
   - Customers' spending patterns before joining indicate their potential value once they become members. Customer B, for instance, shows high pre-membership spending, making them a strong candidate for retention strategies.

### 9. **Customer Points Based on Spending**
   - **Finding**: 
     - Customer A earned 860 points, customer B earned 940 points, and customer C earned 360 points.
   - This finding provides insight into customer loyalty and engagement. High spenders and customers purchasing high-point items like **sushi** have the most points, suggesting that points-based loyalty programs can significantly influence customer retention and lifetime value.

### 10. **Points Earned in the First Month After Joining Membership**
   - **Finding**:
     - Customer A earned 1370 points by the end of January, primarily through purchases made in the first week (with 2x points).
     - Customer B earned 820 points in the same period.
   - Customers who joined in January had an immediate surge in points, especially during the 2x promotion. This shows that time-limited offers for new members can boost early engagement and drive repeat visits.

