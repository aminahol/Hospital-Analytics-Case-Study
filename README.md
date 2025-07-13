# End to End Hospital Analytics

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


---


## Insights

- **High No-Show Rates in Critical Services**  
  Departments like X-ray (66%) and Emergency (~60%) report the highest no-show rates. These are not only operational inefficiencies but potential risks for delayed care.

- **Patient Care Fragmentation**  
  Several patients saw 3+ doctors, and one consulted with 8 specialists. This signals either complex health needs or disjointed care coordination both of which require process improvement and better patient tracking systems.

- **Midweek Service Overload**  
  The busiest appointment days are Tuesdays and Wednesdays, creating potential bottlenecks in scheduling, staff availability, and service delivery. Spreading appointments more evenly could ease staff workload and enhance patient experience.

- **Insurance Dependence**  
  All patients are insured, with MedCare Plus alone covering 42% of treatments. This dominance makes it a critical financial partner.

- **Revenue Performance Gaps**  
  While Chemotherapy generates the most revenue, treatments like MRI and Physiotherapy are among the most expensive. This raises questions about pricing alignment, margins, and accessibility.

- **Branch-Level Opportunity**  
  The Central branch delivers 41.6% of total revenue, yet lacks oncology; revealing a strong case for expanding high value services like chemotherapy to that location.

- **Irregular Monthly Revenue**  
  Revenue shows volatile month-over-month trends. This may relate to seasonal patient flow, billing delays, or lack of proactive appointment targeting.

---

## Final Recommendations

- **Reduce No-Shows in Key Departments**  
  Investigate root causes of absenteeism in X-ray and Emergency services. A mix of SMS/Email reminders, pre-visit calls, and workflow audits could boost attendance rates and operational throughput.

- **Strengthen Care Coordination**  
  Patients seeing 5+ doctors may benefit from care navigation support or dedicated case managers. This will reduce redundancy, improve outcomes, and enhance patient satisfaction.

- **Redistribute Appointment Load**  
  Encourage off-peak bookings through digital nudges or flexible hours to reduce the midweek bottleneck. This improves staff scheduling and balances demand across the week.

- **Expand Oncology in High Performing Branches**  
  The Central branch's strong financial return without oncology indicates prime potential for expansion. A feasibility study on service rollout is recommended.

- **Leverage Insurance Partnerships**  
  Collaborate with MedCare Plus and other insurers on bundled payments or preventive care incentives, as over 40% of patients are concentrated under one payer.

- **Forecast & Stabilize Revenue Cycles**  
  Address month-to-month revenue swings by creating predictive models for appointment load and implementing consistent billing practices.

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

- Expand data to include patient demographics and health outcomes  
- Implement predictive models for no-show probability

---

## Explore the Dashboard

This interactive Power BI report allows you to explore patient behavior, department performance, and financial trends through a user-friendly interface.

[Click here to launch the Hospital Analytics Dashboard](https://app.powerbi.com/view?r=eyJrIjoiZjQwMDUyMzgtNTRjMy00ZGJmLWI0ZDgtZDI2ZWYwOWQyZDYwIiwidCI6IjEwMWQ0NjY0LTg3OGEtNGUzYi04N2Y3LTc4ZjA4Yjc2MjhiYSJ9)


