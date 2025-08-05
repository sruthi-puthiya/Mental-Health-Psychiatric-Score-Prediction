SELECT * FROM [dbo].[ASSESSMENT_QUESTIONS]
SELECT * FROM [dbo].[Assessment_Answer]
select * from [dbo].[PATIENT]
select * from [dbo].[HEALTH_RECORD]
select * from [dbo].[PROVIDER]
select * from [dbo].[ILLNESS_LIST]
select * from [dbo].[MEDICINE_LIST]
select * from [dbo].[THERAPY_LIST]

SELECT * FROM [dbo].[ASSESSMENT_QUESTIONS]
SELECT * FROM [dbo].[Assessment_Answer]
select * from [dbo].[ILLNESS_LIST]
SELECT * FROM [dbo].[Treatment_plan]
SELECT * FROM [dbo].[Patient_Illness]
SELECT * FROM [dbo].[Patient_Medication]
SELECT * FROM [dbo].[Patient_Therapy]

SELECT 
    PatientID, 
    PatientFirstName, 
    PatientLastName, 
    PatientDOB,
    DATEDIFF(YEAR, PatientDOB, GETDATE()) - 
    CASE 
        WHEN MONTH(PatientDOB) > MONTH(GETDATE()) 
            OR (MONTH(PatientDOB) = MONTH(GETDATE()) AND DAY(PatientDOB) > DAY(GETDATE())) 
        THEN 1 ELSE 0 END AS Age
FROM PATIENT;


SELECT 
    PatientID, 
    PatientFirstName, 
    PatientLastName, 
    PatientDOB,
    YEAR(getdate())-YEAR(patientDOB)
FROM PATIENT;
