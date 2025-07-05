# Hospital Analytics Dashboard – SQL & Power BI Project

## Overview

This project presents a full scale hospital analytics solution built using **SQL** for data processing and **Power BI** for interactive data visualization. It was developed to simulate a real world hospital environment with the goal of uncovering key clinical, financial, and operational insights.

As a data analyst with experience in healthcare, I applied best practices in data validation, modeling, and business intelligence to deliver an analytics ready system that helps hospital decision makers monitor performance, detect inefficiencies, and make data informed decisions.

---

## Objectives

- Clean, validate, and model relational hospital data from multiple sources  
- Derive key healthcare KPIs through structured SQL queries  
- Design a professional, business facing Power BI dashboard  
- Uncover actionable insights in patient behavior, no show rates, insurance use, hospital branch performance, and revenue trends

---

## Data Sources

Simulated datasets representing 5 key hospital entities:

- `patients`
- `doctors`
- `appointments`
- `treatments`
- `billing`

---

## Tools & Technologies

- **SQL (MySQL)** – Data cleaning, relationship validation, KPI computation  
- **Power BI** – Visualization and dashboard development  
- **Star Schema Modeling** – Central fact tables with supporting dimension tables

---

## Key Features

### 1. Data Cleaning & Validation (SQL)

- No missing values or duplicates in any table  
- Referential integrity maintained across patient, doctor, appointment, treatment, and billing records  
- Validations for billing inconsistencies and data accuracy

### 2. KPIs and Metrics (SQL)

- Total Patients: 50  
- Total Appointments: 200  
- Average Appointments per Patient: 4.17  
- Total Revenue (Paid): ₦551,000  
- Average Revenue per Patient: ₦11,500  
- Refund Rate (Failed Payments): 33%

---

## Power BI Dashboard Design

The dashboard was organized into two key report pages:

### Page 1: Patient Flow & Clinical Operations

- KPIs: Patient volume, appointment trends, average visits  
- Heatmap: Busiest weekdays (Tuesdays and Wednesdays)  
- Line Chart: Appointments trend by month (peak in April, dip in September)  
- Column Charts:
  - Appointments by specialization (Pediatrics ranked highest)
  - Show vs No-Show rates by treatment type and reason for visit  
- Slicers: Hospital branch, date, reason for visit, treatment type, doctor specialization, appointment status

**Insight Highlights:**

- X-ray had the highest no-show rate at 66%  
- Therapy, consultation, and emergency visits all showed ~60% no-show rates  
- Some patients consulted multiple doctors, suggesting complex care needs or loyalty

---

### Page 2: Financial & Operational Performance

- Total revenue: ₦551,000  
- Average revenue per patient: ₦11,500  
- Donut chart of insurance provider distribution  
- Revenue by treatment type: Chemotherapy highest, X-ray and ECG most common  
- Revenue trend showed irregular monthly patterns  
- Table of top 7 patients by revenue and treatments received  
- Doctor performance metrics: revenue, appointment volume, and patient count  
- Payment method distribution  

**Insight Highlights:**

- The **Central branch alone contributed 41.6% of total revenue (₦229,000)** despite not offering oncology services  
- All patients were insured, with **Medicare Plus covering over 40%**  
- **Dr. Sarah (Dermatology)** led in both revenue and patient volume

---

## Business Value

- Identified departments and services requiring intervention due to high no-show rates  
- Revealed underutilized time slots and overburdened days to inform staffing  
- Surface level data transformed into decision ready insights for financial planning and clinical performance  
- Insurance and branch analytics aligned with strategic hospital operations

---

## Conclusion

This project demonstrates the practical application of SQL and Power BI in transforming raw healthcare data into a compelling, executive ready performance dashboard. Every insight was derived from clean, validated data and visualized for maximum business impact.

---

## Next Steps

- Expand dashboard to include patient demographics and health outcomes  
- Implement predictive models for no-show probability  
- Automate the data refresh cycle using Power BI Gateway  

