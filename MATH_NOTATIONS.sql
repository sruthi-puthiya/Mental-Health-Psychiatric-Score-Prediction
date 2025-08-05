----1
--select * from ILLNESS_LIST

select * from ILLNESS_LIST
where PredefinedScore>50;
-----2
select count(*) AS TOTAL_Patients,
SafetyConcerns from [dbo].[HEALTH_RECORD] 
group by SafetyConcerns;

--- 3
select TreatmentPlanName,
count(*) TOTAL_PATIENTS 
from [dbo].[Treatment_plan]
where ConsultationDuration>48
group by TreatmentPlanName;

--- 4
select PatientID,SafetyConcerns from HEALTH_RECORD
where PsychiatricScore is NULL;

--- 5
SELECT ProviderID, 
AVG(ConsultationDuration) AVERAGE_MEET_TIME
FROM Treatment_plan
GROUP BY ProviderID;

--- 1 Fetch patient with illness 'Anxiety'
select PatientFirstName
from PATIENT P
INNER JOIN Patient_Illness PL
on P.PatientID=PL.PatientID
where TreatmentNotes='CBT suggested';
--- 2. left outer join
---
select count(P.PatientID) as EMERGENCY_PATIENTS,PsychiatricScore
from PATIENT P
Inner JOIN HEALTH_RECORD HR
on P.PatientID=HR.PatientID
group by HR.PsychiatricScore
having PsychiatricScore<=10;

------ Take the total count of patients, providers,therapeis, medications which are assigned in treatment plan or actively involved in clinic
select 
(select count(distinct PatientID) from Treatment_plan) as TOTAL_PATIENT_IN_CLINIC,
(select count(distinct ProviderID) from treatment_plan) as TOTAL_PROVIDERS_IN_CLINIC,
(select count(distinct MedicineID) from Patient_Medication) as TOTAL_MEDICATIONS_USING,
(select count(distinct TherapyID) from Patient_Therapy as TOTAL_THERAPIES_DOING_IN_CLINIC);

