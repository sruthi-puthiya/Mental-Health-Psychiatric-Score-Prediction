--- 1.  List the patients who do not have a assigned treatment plan/provider in treatment table.
---     Also check if they attended the assignments without psychiatric score or they are not assigned with treatment plan.

SELECT P.PatientID, P.PatientFirstName, P.PatientLastName
FROM PATIENT P
WHERE 
NOT EXISTS  (SELECT * 
			FROM Treatment_plan T
			WHERE P.PatientID = T.PatientID) or
(NOT EXISTS (Select * from Assessment_Answer AA
			Where P.PatientID=AA.PatientID) and 
NOT EXISTS  (select * from HEALTH_RECORD H
			where H.PatientID=P.PatientID and
			H.PsychiatricScore is NULL));

--- 2.	Find most commonly prescribed medication in the clinic.
---		Retrieve the most prescibed medication which have maximum number of patients as customers to keep in pharmacy
SELECT ML.MedicineName, 
COUNT(PM.PatientID) AS PrescriptionCount
FROM MEDICINE_LIST ML
JOIN Patient_Medication PM ON ML.MedicineID = PM.MedicineID
GROUP BY ML.MedicineName
HAVING COUNT(PM.PatientID) = 
(SELECT MAX(CountPatients) 
    FROM (SELECT COUNT(PatientID) AS CountPatients 
			FROM Patient_Medication 
			GROUP BY MedicineID) AS Temp);

--- 3.	Analyse the effective ness of therapy which has highest number of patients marked with active,improved followup status.

SELECT TherapyName, 
       COUNT(*) AS TotalPatients
FROM Therapy_List
WHERE TherapyID IN (
    SELECT TherapyID 
    FROM Patient_Therapy
    WHERE PatientID IN (
        SELECT PatientID 
        FROM Treatment_plan 
        WHERE FollowUpStatus IN ('Active', 'Improved')))
GROUP BY TherapyName
ORDER BY TotalPatients DESC;

--- 4.	Select the patients and treatment plan who are under medication with therapy and list the illness also
SELECT distinct P.PatientID,
P.PatientFirstName+P.PatientLastName as PatientName,
T.TreatmentPlanName,
IL.IllnessName
FROM Patient P
Inner join Treatment_plan T
on P.PatientID=T.PatientID
inner join Patient_Illness PL
on P.PatientID=PL.PatientID
inner join ILLNESS_LIST IL
on PL.IllnessID=IL.IllnessID
WHERE P.PatientID IN (
    SELECT PM.PatientID
    FROM Patient_Medication PM
	INNER JOIN Patient_Therapy PT
	on PM.PatientID=PT.PatientID);


---	5.	Calculate by evaluating different patients in the system. How the psychiatric score and medicines are connected.
---		calculate each for each medicine what score can be assigned get the provider name with this.

SELECT ML.MedicineID,ML.MedicineName,
    (SELECT AVG(CAST(H.PsychiatricScore AS FLOAT))
     FROM HEALTH_RECORD H
     WHERE H.PatientID = P.PatientID
        AND H.PsychiatricScore IS NOT NULL) AS AvgPsychiatricScore
FROM PATIENT P
    INNER JOIN Patient_Medication PM ON P.PatientID = PM.PatientID
    INNER JOIN MEDICINE_LIST ML ON PM.MedicineID = ML.MedicineID
GROUP BY ML.MedicineID, ML.MedicineName, P.PatientID
ORDER BY AvgPsychiatricScore DESC;



