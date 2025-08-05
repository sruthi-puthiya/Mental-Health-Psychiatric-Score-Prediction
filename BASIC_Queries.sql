--- 1. Medicine which is used for treating Bipolar Disorder and which has side effects like headache or weight gain.
SELECT MedicineName
FROM MEDICINE_LIST
WHERE MedicineUses like '%Bipolar%' 
and MedicineSideEffects not like '%Headache%' 
and MedicineSideEffects not like '%Weight gain%';

--select * from MEDICINE_LIST

--- 2.  Display Female patient approximate age who have emergency contact and personal contact with consultation year 2024

SELECT  PatientFirstName+PatientLastName as PATIENT_NAME, 
YEAR(getdate())-YEAR(PatientDOB) as AGE
FROM PATIENT     
WHERE PatientGender='Female' and 
(EmergencyContactName is not null and 
EmergencyContactPhone is not null and 
EmergencyContactRelationship is not null)
and PatientPhone is not null
ORDER BY AGE DESC;


--- 3. Understand the expertise level of Provider available inside the clinic. 
---    Average experience in each specialization category and maximum experience in the specilization should show.

SELECT Specialization, 
AVG(YearsExperience) AS AvgExperience, 
MAX(YearsExperience) AS MostExperienced
FROM PROVIDER
GROUP BY Specialization
ORDER BY AvgExperience DESC;


--- 4.  Count the patients having score between 10-30 in emergency patiemts category, 51-70 in Counceling category.
---     31 to 50 in Medication category , 70-90 in Therapy category

select Count(*) COUNT_OF_PATIENTS,
case 
when PsychiatricScore between 1 and 30 then 'Emergency'
when PsychiatricScore between 31 and 50 then 'Medication'
when PsychiatricScore between 51 and 70 then 'Counceiling'
when PsychiatricScore between 71 and 91 then 'Therapy' 
Else 'No Attention' END as CATEGORY
from HEALTH_RECORD
group by 
case 
when PsychiatricScore between 1 and 30 then 'Emergency'
when PsychiatricScore between 31 and 50 then 'Medication'
when PsychiatricScore between 51 and 70 then 'Counceiling'
when PsychiatricScore between 71 and 91 then 'Therapy' 
Else 'No Attention' END;


--- 5.	Evaluate current treament plan of active patients and get count of patients in each treatment plan. 
---		Treatment plan should not be in 'General Counceling' and Count of patients should be greater then 1.
SELECT COUNT(*) AS TOTAL_PATIENTS_IN_PLAN,
TreatmentPlanName
FROM Treatment_plan
WHERE FollowUpStatus='Active'
GROUP BY TreatmentPlanName
HAVING (TreatmentPlanName <> 'General Counseling' 
AND COUNT(PatientID)>1);

