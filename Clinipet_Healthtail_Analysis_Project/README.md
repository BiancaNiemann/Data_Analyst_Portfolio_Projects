# 🐾 Clinipet - HealthTail Analysis Project
##### Role: Business Intelligence Analyst
##### Client: HealthTail Veterinary Hospital
##### Organization: Clinipet – IT & Analytics Solutions for Veterinary Clinics and Pet Hotels
##### Timeline: Early 2026
##### Tools: Big Query & Looker Studio

### 📘 Project Overview
HealthTail, one of the largest veterinary hospitals in the city, partnered with Clinipet to modernize their manual medication auditing processes and gain deeper insights into disease and diagnosis trends among their patients.

As a BI Analyst at Clinipet, I led the data integration, transformation, and visualization efforts to deliver actionable insights via an interactive dashboard. This project combines ETL pipelines in BigQuery and interactive reporting in Looker Studio to support data-driven decisions in veterinary care.

### 🎯 Project Goals
HealthTail faced two major challenges:

1. Audit Medication Purchases and Expenses
* Automate the tracking of annual medication procurement and usage.
* Provide insights into medication costs and usage efficiency.

2. Monitor Diagnoses and Disease Trends
* Identify common diagnoses segmented by pet type and breed.

Use trends to inform staffing, medication planning, and inventory management.

### ✅ Deliverables
✔️ Upload and structur source .csv files in BigQuery

✔️ Clean and transform raw data to correct errors and inconsistencies

✔️ Create unified, analysis-ready datasets

✔️ Build an interactive Looker Studio dashboard displaying key metrics

✔️ Present findings in a live client presentation

### 📊 Dataset Description
#### `healthtail_reg_cards.csv` – Patient Registration Data

| Column Name       | Type    | Description                                         |
|-------------------|---------|-----------------------------------------------------|
| patient_id        | String  | Unique pet ID                                       |
| owner_id          | Integer | Unique owner ID                                     |
| owner_name        | String  | Owner's full name                                   |
| pet_type          | String  | Species (e.g., Dog, Cat)                            |
| breed             | String  | Breed of the pet                                    |
| patient_name      | String  | Name of the pet                                     |
| gender            | String  | Gender of the pet                                   |
| patient_age       | Integer | Age in years                                        |
| date_registration | Date    | Registration date                                   |
| owner_phone       | String  | Contact number (incl. country code)                 |

⚠️ Note: Contains manual entry errors, missing values, and inconsistent formats.
---


#### `visits.csv` – Medical Visit Logs

| Column Name    | Type     | Description                                       |
|----------------|----------|-------------------------------------------------|
| visit_id       | String   | Unique ID per visit                              |
| patient_id     | String   | Pet associated with the visit                    |
| visit_datetime | DateTime | Timestamp of visit                               |
| doctor         | String   | Attending veterinarian                           |
| diagnosis      | String   | Diagnosis given                                 |
| med_prescribed | String   | Medication prescribed                            |
| med_dosage     | Float    | Dosage (as a share of a full package)           |
| med_cost       | Float    | Cost of prescribed medication                    |

---

#### `invoices.csv` – Medication Purchase Records

| Column Name   | Type    | Description                                     |
|---------------|---------|------------------------------------------------|
| month_invoice | Date    | Month and year of invoice                       |
| invoice_id    | String  | Unique invoice identifier                       |
| supplier      | String  | Supplier name                                  |
| med_name      | String  | Name of medication purchased                    |
| packs         | Float   | Number of packs purchased                       |
| price         | Float   | Price per pack                                 |
| total_price   | Float   | Total transaction cost (packs × price)         |

---
### ⚙️ Tools & Technologies
* Google BigQuery – Data warehousing, SQL analysis, ETL

* Looker Studio – Interactive dashboard creation

## 🛠️ Step 1 – Creating Clean and Aggregated Data

### 1. 🔧 Data Cleaning

To ensure the data was analysis-ready, the following cleaning steps were applied:

- Standardized inconsistent phone numbers and names
- Replaced null or missing `breed` values with `"Unknown"`
- Removed titles like *Mr*, *Mrs* from `owner_name` for consistency
- Standardized `patient_name` to lowercase and capitalized format

---

### 2. 📦 Aggregated Table: `healthtail_med_audit`

HealthTail requested a dedicated monthly medication tracking table that includes both:

- **Purchases** (from the `invoices` table) - stock in
- **Usage** (from the `visits` table) - stock out

A query was written to aggregate this information and output a new table called `healthtail_med_audit`, saved in the `integrations` folder.

📌 *Below is a preview of the first 10 rows of the `healthtail_med_audit` table.*

<img width="680" alt="image" src="https://github.com/user-attachments/assets/ed3c32a6-d1cf-4d44-8b3c-d67ad1ac242b" />

View the SQL queries in [Step 1](./sql_files/Step_1.sql)

---

## 📊 Step 2 – Answering Research Questions with SQL

The following business questions were provided by HealthTail. For each, I wrote SQL queries in BigQuery to extract insights.

### 1️⃣ What medication did we spend the most money on in total?
<img width="927" alt="image" src="https://github.com/user-attachments/assets/00a64b23-e3c1-4347-ac14-353c794f068f" />
<img width="982" alt="image" src="https://github.com/user-attachments/assets/ef5947b0-e67c-4aad-929e-c4fd456de245" />

### 2️⃣ What medication had the highest monthly `total_value` spent on patients? At what month?
<img width="923" alt="image" src="https://github.com/user-attachments/assets/92e7fae7-c563-4d58-9970-e5af63d35026" />
<img width="459" alt="image" src="https://github.com/user-attachments/assets/4fb881d9-0d0f-4f8b-8617-aa3a68285919" />

### 3️⃣ What month was the highest in packs of meds spent in the vet clinic?
<img width="926" alt="image" src="https://github.com/user-attachments/assets/01f477c8-8396-4432-befc-8380cc3dc0d0" />
<img width="986" alt="image" src="https://github.com/user-attachments/assets/0bd4e18f-6b81-4d33-99a1-bbefeb374738" />

### 4️⃣ What’s the average monthly amount of packs spent on the med that generated the most revenue?
<img width="927" alt="image" src="https://github.com/user-attachments/assets/5ccfdc01-7c28-454b-bf96-1e80a19d9b37" />
<img width="985" alt="image" src="https://github.com/user-attachments/assets/a6dd6708-cbf3-4eb7-9179-a147fcbbbe63" />

View the SQL queries in [Step 2](./sql_files/Step_2.sql)
---

## 📈 Step 3 – Creating Interactive Report in Looker Studio

HealthTail management required a powerful, user-friendly dashboard to:

- Monitor **common diagnoses**
- Track **disease prevalence by breed**
- Analyze **medication spending trends**

The dashboard was designed to be interactive and support:

- 📌 Drill-down functionality  
- 📊 A variety of visualization types (bar charts, line graphs, heatmaps, etc.)

---

### 📌 HealthTail Key Concerns Addressed in Dashboard

Each concern is paired with an appropriate chart in the Looker Studio dashboard:

1. **What are the most common diagnoses and diseases overall?**  
   ➤ Breakdowns provided by pet type (e.g., dog vs. cat vs. hamster)
<img width="421" alt="image" src="https://github.com/user-attachments/assets/7546dbf9-aa1a-4e87-a0c0-875d2e296711" />

2. **Which diseases are most prevalent among specific breeds?**  
   ➤ Enables tailored care and better inventory planning
<img width="415" alt="image" src="https://github.com/user-attachments/assets/42f1dff3-f221-463a-aa1a-6ef114cef8d8" />

3. **Which diseases incur the highest spending, and how frequently do they appear in the data?**  
   ➤ Highlights costly recurring conditions
<img width="346" alt="image" src="https://github.com/user-attachments/assets/c1056e7e-26b6-49ee-833c-5e68eb9a1152" />

4. **Are certain pet types (e.g., dogs, cats, hamsters) more susceptible to specific diseases or associated with higher treatment costs?**  
   ➤ Supports budgeting and veterinary resourcing
<img width="351" alt="image" src="https://github.com/user-attachments/assets/d3390ebb-5b7e-494d-80e1-e5d7980ddebd" />

5. **How does age influence the prevalence of certain diseases?**  
   ➤ Age-group trends help guide preventive care
<img width="776" alt="image" src="https://github.com/user-attachments/assets/9747263b-0375-4b80-b287-da8105d141c8" />

6. **How does spending on medications change over time?**  
   ➤ Tracks inventory and supplier patterns
<img width="835" alt="image" src="https://github.com/user-attachments/assets/f785ce9f-8743-4153-ac95-a0b44327131d" />

7. **Is there an increase in diagnoses of certain types over time?**  
   ➤ Flags potential seasonal trends or outbreaks
<img width="841" alt="image" src="https://github.com/user-attachments/assets/f06aefda-6cfb-470f-98ea-8e36977d5687" />


### 🧠 Lessons Learned
The importance of clean, structured source data in building meaningful dashboards

How to design scalable schemas for real-world analytical use cases

Leveraging Looker Studio for clear communication with non-technical stakeholders

## 🎥 Demo & Dashboard

- 📽️ **Video Presentation:** [Watch here](https://www.loom.com/share/f44ae7b2204340099bb59e713af6c135?sid=039a7b60-0b9b-4a77-bdef-77e76fc7d65e)
- 📊 **Interactive Dashboard:** [View Looker Studio Report](https://lookerstudio.google.com/reporting/0ff0031a-0ea0-41f7-83ac-5018996ddc52/page/p_drybey9btd/edit)
