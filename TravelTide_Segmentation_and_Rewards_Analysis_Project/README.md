# 🌍 TravelTide Customer Segmentation and Rewards Program

## 📌 Objective

This project analyzes customer data from the fictional travel company **TravelTide** to identify distinct customer segments and recommend tailored rewards based on behavioral and demographic insights. The goal is to enhance customer retention and improve targeted marketing strategies.

As part of the analysis, the dataset was narrowed down to customers with exactly **7 sessions** during **January 2023**, to create a focused and consistent cohort for segmentation.

---

## 🗃️ Dataset Description
* postgres://Test:bQNxVzJL4g6u@ep-noisy-flower-846766.us-east-2.aws.neon.tech/TravelTide

The TravelTide dataset consists of four main tables:

### 🧍‍♂️ `users`
Contains demographic and profile information for each user.
- `user_id`, `birthdate`, `gender`, `married`, `has_children`,  
  `home_country`, `home_city`, `home_airport`, `home_airport_lat`, `home_airport_lon`, `sign_up_date`

### 🖱️ `sessions`
Includes data on browsing sessions with at least two clicks.
- `session_id`, `user_id`, `trip_id`, `session_start`, `session_end`,  
  `flight_discount`, `hotel_discount`, `flight_discount_amount`, `hotel_discount_amount`,  
  `flight_booked`, `hotel_booked`, `page_clicks`, `cancellation`

### ✈️ `flights`
Details about purchased flights.
- `trip_id`, `origin_airport`, `destination`, `destination_airport`, `seats`, `return_flight_booked`,  
  `departure_time`, `return_time`, `checked_bags`, `trip_airline`,  
  `destination_airport_lat`, `destination_airport_lon`, `base_fare_usd`

### 🏨 `hotels`
Information about booked hotel stays.
- `trip_id`, `hotel_name`, `nights`, `rooms`,  
  `check_in_time`, `check_out_time`, `hotel_per_room_usd`

---

## 🛠️ Tools and Technologies

- **Python**: Data exploration and filtering and cleaning
- **SQL**: Data exploration and filtering
- **Google Sheets**: Initial exploration, planning and checks
- **Tableau**: Visualizations and dashboard creation
- **Decision Tree Model**: For identifying key behavior splits

---

## 📊 Key Findings

- **7 distinct customer segments** were identified based on a combination of demographic and behavioral factors.
- A **decision tree model** helped uncover similarities in session types, booking frequency, and loyalty status.
- Each segment was assigned a **tailored rewards offer**, ranging from discounted business-class upgrades to family vacation packages, based on their preferences and value to the company.
- **Segment behavior patterns** included:
  - High-value business travelers with frequent weekday sessions.
  - Budget-conscious family travelers who booked well in advance.
  - Younger solo travelers who favored spontaneous weekend trips.

These insights can be used by TravelTide to implement a **personalized rewards program** that aligns with customer behavior and improves satisfaction and retention.

---

## 📈 Notebooks and Dashboards

You can find the analysis notebooks and Tableau dashboard in this repository:

- [🔗 Github Data Files](https://github.com/BiancaNiemann/TravelTide_Segmentation_and_Rewards_Analysis/tree/main/data)
- [🔗 Github Documents Files](https://github.com/BiancaNiemann/TravelTide_Segmentation_and_Rewards_Analysis/tree/main/documents)
- [🔗 Github Notebooks Files](https://github.com/BiancaNiemann/TravelTide_Segmentation_and_Rewards_Analysis/tree/main/notebooks)
- [🔗 Presentation Recording](https://www.canva.com/design/DAGnU5ALj60/K5Gq-TxZ_1K88RZTow9UVA/view?utm_content=DAGnU5ALj60&utm_campaign=designshare&utm_medium=link2&utm_source=uniquelinks&utlId=h68405af896)
- [🔗 Tableau Public Profile](https://public.tableau.com/app/profile/bianca.niemann/viz/TravelTide_17474146781030/ClicksperSession)



---

## ⚠️ Challenges

- Identifying meaningful behavioral patterns in a relatively small cohort (January 2023, 7-session users) proved difficult at first.
- Several clustering and classification approaches were tested, but a **decision tree** proved most effective in segmenting users based on session characteristics and travel types.
- A future iteration could include data from the **full year** to enhance accuracy and uncover more robust behavioral trends.

---
