--Hospital Data Analysis


CREATE TABLE Hospital_data(
Hospital_Name VARCHAR(100),
Location VARCHAR(100),
Department VARCHAR(100),
Doctor_count INT,
patient_count INT,
Admission_date DATE,
Dicharge_date DATE,
Medical_Expenses DECIMAL (10,2)
);

SELECT * FROM Hospital_data

--1.Total Number of Patients
-- Write an SQL query to find the total number of patients across all hospitals.
SELECT SUM(Patient_count)AS Total_Patient 
FROM Hospital_data;

/*2.Average Number of Doctors per Hospital
Retrieve the average count of doctors available in each hospital.*/
SELECT AVG(Doctor_count)AS  Avg_patient
FROM Hospital_data;

/*3.Top 3 Departments with the Highest Number of Patients
Find the top 3 hospital departments that have the highest number of patients.*/
SELECT * FROM Hospital_Data ORDER BY Patient_count DESC LIMIT 3; 

/*4.Hospital with the Maximum Medical Expenses
Identify the hospital that recorded the highest medical expenses*/
 SELECT * FROM Hospital_Data ORDER BY Medical_Expenses DESC LIMIT 1; 

 /*5.Daily Average Medical Expenses
 Calculate the average medical expenses per day for each hospital.*/
SELECT Hospital_Name,
       Admission_date,
       AVG(Medical_Expenses) AS Avg_Expenses
FROM Hospital_data
GROUP BY Hospital_Name, Admission_date
ORDER BY Hospital_Name, Admission_date;
/*6.Longest Hospital Stay
Find the patient with the longest stay by calculating the difference between 
Discharge Date and Admission Date.*/
SELECT Hospital_name,Admission_date,Dicharge_date,
       (dicharge_date - Admission_date) AS Stay_Days
FROM Hospital_data
ORDER BY Stay_Days DESC
LIMIT 1;

/*7 Total Patients Treated Per City
Count the total number of patients treated in each city*/
SELECT Location,
       SUM(Patient_count) AS Total_Patients
FROM Hospital_data
GROUP BY Location
ORDER BY Total_Patients DESC;
/*.8 Average Length of Stay Per Department
Calculate the average number of days patients spend in each department*/
SELECT Department,
       AVG(dicharge_date - Admission_date) AS Avg_Stay_Days
FROM Hospital_data
GROUP BY Department
ORDER BY Avg_Stay_Days DESC;

/*9.Identify the Department with the Lowest Number of Patients
Find the department with the least number of patients*/
SELECT Department,
       Min(Patient_count) AS Least_patient
FROM Hospital_data
GROUP BY Department
ORDER BY Least_patient ASC
LIMIT 1;

/*10. Monthly Medical Expenses Report
Group the data by month and calculate the total medical expenses for each month.*/
SELECT TO_CHAR(Admission_date, 'Month') AS Month,
       SUM(Medical_Expenses) AS Total_Medical_Expenses
FROM Hospital_data
GROUP BY TO_CHAR(Admission_date, 'Month'),
         EXTRACT(MONTH FROM Admission_date)
ORDER BY EXTRACT(MONTH FROM Admission_date);
