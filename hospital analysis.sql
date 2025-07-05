-- DATA CLEANING & VALIDATION


#1. Checking for columns with missing values across all datasets
-- This query checks for NULLs across all important columns in each table
SELECT 'patients' AS table_name, COUNT(*) AS null_rows
FROM patients
WHERE CONCAT_WS('', patient_id, first_name, last_name, gender, date_of_birth, 
                contact_number, address, registration_date, 
                insurance_provider, insurance_number) IS NULL
UNION ALL
SELECT 'doctors', COUNT(*) FROM doctors
WHERE CONCAT_WS('', doctor_id, first_name, last_name, specialization, 
                phone_number, years_experience, hospital_branch) IS NULL
UNION ALL
SELECT 'appointments', COUNT(*) FROM appointments
WHERE CONCAT_WS('', appointment_id, patient_id, doctor_id, appointment_date, 
                appointment_time, reason_for_visit, status) IS NULL
UNION ALL
SELECT 'treatments', COUNT(*) FROM treatments
WHERE CONCAT_WS('', treatment_id, appointment_id, treatment_type, cost, treatment_date) IS NULL
UNION ALL
SELECT 'billing', COUNT(*) FROM billing
WHERE CONCAT_WS('', bill_id, patient_id, treatment_id, bill_date, amount, 
                payment_method, payment_status) IS NULL;
-- No missing values across all tables

#2. Checking for full duplicate rows across all tables
SELECT 'patients' AS table_name, COUNT(*) AS duplicate_rows
FROM patients
GROUP BY patient_id, first_name, last_name, gender, date_of_birth, 
         contact_number, address, registration_date, insurance_provider, insurance_number, email
HAVING COUNT(*) > 1
UNION ALL
SELECT 'doctors', COUNT(*) FROM doctors
GROUP BY doctor_id, first_name, last_name, specialization, phone_number, years_experience, hospital_branch, email
HAVING COUNT(*) > 1
UNION ALL
SELECT 'appointments', COUNT(*) FROM appointments
GROUP BY appointment_id, patient_id, doctor_id, appointment_date, appointment_time, reason_for_visit, status
HAVING COUNT(*) > 1
UNION ALL
SELECT 'treatments', COUNT(*) FROM treatments
GROUP BY treatment_id, appointment_id, treatment_type, description, cost, treatment_date
HAVING COUNT(*) > 1
UNION ALL
SELECT 'billing', COUNT(*) FROM billing
GROUP BY bill_id, patient_id, treatment_id, bill_date, amount, payment_method, payment_status
HAVING COUNT(*) > 1;
-- No duplicate rows across all tables

#3. Validating foreign key relationships
-- Checks that foreign keys reference existing records
SELECT 'appointments - invalid patient' AS issue, a.appointment_id
FROM appointments a
LEFT JOIN patients p ON a.patient_id = p.patient_id
WHERE p.patient_id IS NULL
UNION ALL
SELECT 'appointments - invalid doctor', a.appointment_id
FROM appointments a
LEFT JOIN doctors d ON a.doctor_id = d.doctor_id
WHERE d.doctor_id IS NULL
UNION ALL
SELECT 'treatments - invalid appointment', t.treatment_id
FROM treatments t
LEFT JOIN appointments a ON t.appointment_id = a.appointment_id
WHERE a.appointment_id IS NULL
UNION ALL
SELECT 'billing - invalid treatment', b.bill_id
FROM billing b
LEFT JOIN treatments t ON b.treatment_id = t.treatment_id
WHERE t.treatment_id IS NULL
UNION ALL
SELECT 'billing - invalid patient', b.bill_id
FROM billing b
LEFT JOIN patients p ON b.patient_id = p.patient_id
WHERE p.patient_id IS NULL;

#4. Checking for billing records marked as 'Paid' but with amount = 0
SELECT * FROM billing
WHERE payment_status = 'Paid' AND amount = 0;
-- All paid records have valid amounts



-- KPI & METRIC DASHBOARD

#1. Total number of patients
-- Overall patient count in the database
SELECT COUNT(*) AS total_patients FROM patients; -- 50 Total Patients

#2. Total insured patients
-- Number of patients with insurance coverage
SELECT COUNT(*) AS insured_patients FROM patients WHERE insurance_provider IS NOT NULL; -- 50 Insured Patients

#3. Total uninsured patients
-- Number of patients without insurance
SELECT COUNT(*) AS uninsured_patients FROM patients WHERE insurance_provider IS NULL;-- 0 Uninsured patients

#4. Average appointments per patient
-- Shows how frequently patients return
SELECT ROUND(COUNT(*) / (SELECT COUNT(*) FROM patients), 2) AS avg_appointments_per_patient FROM appointments; -- Patients have an average of 4 appointments

-- Calculates average appointments per registered patient (including those with no appointments)
SELECT 
    ROUND(COUNT(a.appointment_id) * 1.0 / COUNT(DISTINCT p.patient_id), 2) AS avg_appointments_per_patient
FROM patients p
LEFT JOIN appointments a ON p.patient_id = a.patient_id;

-- Calculates average appointments per patient who actually had appointments
SELECT 
    ROUND(COUNT(*) * 1.0 / COUNT(DISTINCT patient_id), 2) AS avg_appointments_per_active_patient
FROM appointments;


#5. Total revenue from paid bills
-- Sum of all completed (paid) billings
SELECT SUM(amount) AS total_revenue FROM billing WHERE payment_status = 'Paid'; -- 173k revenue from Paid billsj

#6. Average revenue per patient
SELECT ROUND(SUM(amount) / COUNT(DISTINCT patient_id), 2) AS avg_revenue_per_patient 
FROM billing WHERE payment_status = 'Paid'; -- Each Patient has an average revenue of 5,000

#7. Refund rate (failed payments)
-- Proportion of billing attempts that failed
SELECT ROUND(SUM(CASE WHEN payment_status = 'Failed' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS refund_rate
FROM billing; -- 33 % refund rates from failed payments



-- PATIENT INSIGHTS

#8. Patients with no appointments
-- Useful for outreach or retention strategies
SELECT p.patient_id, CONCAT(p.first_name, ' ', p.last_name) AS patient_name
FROM patients p
LEFT JOIN appointments a ON p.patient_id = a.patient_id
WHERE a.appointment_id IS NULL;

#9. Patients who visited multiple doctors
-- identifying highly engaged or complex patients
SELECT 
    a.patient_id,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    COUNT(DISTINCT a.doctor_id) AS doctors_count
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
GROUP BY a.patient_id, p.first_name, p.last_name
ORDER BY doctors_count DESC;

#10. Insurance distribution among patients
SELECT 
    p.insurance_provider,
    COUNT(t.treatment_id) AS treatment_count,
    ROUND(
        COUNT(t.treatment_id) * 100.0 / 
        SUM(COUNT(t.treatment_id)) OVER (), 
        2
    ) AS percentage_share
FROM treatments t
JOIN appointments a ON t.appointment_id = a.appointment_id
JOIN patients p ON a.patient_id = p.patient_id
GROUP BY p.insurance_provider
ORDER BY treatment_count DESC;


-- DOCTOR INSIGHTS

#11. Top earning doctors by total treatment revenue
SELECT 
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    d.specialization,
    ROUND(SUM(t.cost),2) AS total_revenue
FROM appointments a
JOIN doctors d ON a.doctor_id = d.doctor_id
JOIN treatments t ON a.appointment_id = t.appointment_id
GROUP BY d.first_name, d.last_name, d.specialization
ORDER BY total_revenue DESC;


#12. Doctor workload by number of appointments
-- Useful for workload balancing and scheduling
SELECT 
    d.doctor_id,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    COUNT(a.appointment_id) AS total_appointments
FROM doctors d
LEFT JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name
ORDER BY total_appointments DESC;


-- APPOINTMENT ANALYSIS

#13. Most common reasons for hospital visits
-- Helps prioritize resources and departments
SELECT reason_for_visit, COUNT(*) AS visit_count
FROM appointments
GROUP BY reason_for_visit
ORDER BY visit_count DESC;

#14. Monthly appointments trend
-- Seasonality and operational demand planning
SELECT 
    DATE_FORMAT(appointment_date, '%Y-%m') AS month,
    COUNT(*) AS appointments_count
FROM appointments
GROUP BY month
ORDER BY month;



-- TREATMENTS & FINANCIAL INSIGHTS

#15. Average treatment cost by treatment type
-- Shows pricing trends and potential over or undercharging
SELECT treatment_type, ROUND(AVG(cost), 2) AS avg_cost
FROM treatments
GROUP BY treatment_type
ORDER BY avg_cost DESC;

#16. Monthly revenue trend from billing
-- Financial performance over time
SELECT 
    DATE_FORMAT(bill_date, '%Y-%m') AS month,
    SUM(amount) AS monthly_revenue
FROM billing
GROUP BY DATE_FORMAT(bill_date, '%Y-%m')
ORDER BY month;

#17. Top payment methods used by patients
-- Useful for streamlining billing processes
SELECT payment_method, COUNT(*) AS method_count
FROM billing
GROUP BY payment_method
ORDER BY method_count DESC;

