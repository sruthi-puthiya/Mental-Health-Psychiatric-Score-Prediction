--- 1.	Retrive each patients assessments record with question and answers

SELECT P.PatientFirstName+P.PatientLastName AS PatientName,
HR.RecordID,HR.PsychiatricScore,
Q.Question,AA.Answer
FROM PATIENT P
INNER JOIN HEALTH_RECORD HR ON P.PatientID = HR.PatientID
INNER JOIN Assessment_Answer AA ON HR.RecordID = AA.RecordID
INNER JOIN ASSESSMENT_QUESTIONS Q ON AA.QuestionID = Q.QuestionID
where PsychiatricScore<=80;


--- 2.	Lsist Patients who's identified illness and suggested medication and Therapies and assigned provider name.

select P.PatientFirstName+P.PatientLastName as PATIENT_NAME,
IL.IllnessName as ILLNESS_NAME,
ML.MedicineName AS CURRENT_MEDICINE,
TL.TherapyName AS CURRENT_THERAPY,
PR.FirstName+PR.LastName as PROVIDER_ASSIGNED
from PATIENT P 
INNER JOIN Patient_Illness PL on P.PatientID=PL.PatientID
INNER JOIN ILLNESS_LIST IL on PL.IllnessID=IL.IllnessID
INNER JOIN Patient_Medication PM on P.PatientID=PM.PatientID
INNER JOIN MEDICINE_LIST ML on PM.MedicineID=ML.MedicineID
INNER JOIN Patient_Therapy PT on P.PatientID=PT.PatientID
INNER JOIN THERAPY_LIST TL on PT.TherapyID=TL.TherapyID
INNER JOIN PROVIDER PR on PL.ProviderID=PR.ProviderID;


--- 3.	Find patient with providers who have active treatment plan and their psychiatric score greater from 89 to 100.
select P.PatientID,P.PatientFirstName+P.PatientLastName as PatientName,
T.TreatmentPlanName,
PR.FirstName+PR.LastName as ProviderName
From PATIENT P LEFT JOIN Treatment_plan T on P.PatientID=T.PatientID
LEFT JOIN HEALTH_RECORD HR on HR.PatientID=P.PatientID
LEFT JOIN PROVIDER PR on T.ProviderID=PR.ProviderID
where T.FollowUpStatus='Active'
and HR.PsychiatricScore between 89 and 100;


--- 4.	Get Provider information like name and specialization who have assigned with/without a treatment plan
---		Together with the above retrieve sccheduled treatment plan for each provider and their folloup status

select P.FirstName+P.LastName as ProviderName,
TP.TreatmentPlanName,TP.FollowUpStatus
from Treatment_plan TP
RIGHT OUTer JOIN PROVIDER P on TP.ProviderID=P.ProviderID;


--- 5.	Most commonly prescribed medicines by illness

select I.IllnessName,ML.MedicineName,
COUNT(*) AS PrescriptionCount
from Patient_Illness PI
INNER JOIN ILLNESS_LIST I ON PI.IllnessID = I.IllnessID
INNER JOIN Patient_Medication PM ON PI.PatientID = PM.PatientID
INNER JOIN MEDICINE_LIST ML ON PM.MedicineID = ML.MedicineID
GROUP BY I.IllnessName, ML.MedicineName
ORDER BY I.IllnessName, PrescriptionCount DESC;


