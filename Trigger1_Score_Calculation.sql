-----------------------------------------------Trigger 1  drop trigger CalculatePsychiatricScoreCombined
CREATE TRIGGER CalculatePsychiatricScoreCombined
ON ASSESSMENT_ANSWER
AFTER INSERT
AS
BEGIN
    DECLARE @RecordID INT;
    DECLARE @PatientID INT;
    DECLARE @TotalScore INT;

    -- Cursor to handle multiple rows in the inserted table
    DECLARE cur CURSOR FOR
    SELECT RecordID, PatientID
    FROM INSERTED;

    OPEN cur;

    FETCH NEXT FROM cur INTO @RecordID, @PatientID;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Determine the type of assessment and calculate the total score
        SELECT @TotalScore = 
        CASE 
            WHEN EXISTS (
                SELECT 1 
                FROM ASSESSMENT_QUESTIONS AQ 
                WHERE AQ.QuestionFor = 'PHQ-9' 
                AND AQ.QuestionID IN (SELECT QuestionID FROM ASSESSMENT_ANSWER WHERE RecordID = @RecordID)
            )
            THEN (
                SELECT SUM(CASE 
                            WHEN AA.Answer = 'Not at all' THEN 0  
                            WHEN AA.Answer = 'Several days' THEN 1   
                            WHEN AA.Answer = 'More than half the days' THEN 2
                            WHEN AA.Answer = 'Nearly every day' THEN 3
                            ELSE 0                      
                        END)
                FROM ASSESSMENT_ANSWER AA 
                JOIN ASSESSMENT_QUESTIONS AQ ON AA.QuestionID = AQ.QuestionID
                WHERE RecordID = @RecordID AND PatientID = @PatientID AND AQ.QuestionFor = 'PHQ-9'
            )
            WHEN EXISTS (
                SELECT 1 
                FROM ASSESSMENT_QUESTIONS AQ 
                WHERE AQ.QuestionFor = 'GAF Score' 
                AND AQ.QuestionID IN (SELECT QuestionID FROM ASSESSMENT_ANSWER WHERE RecordID = @RecordID)
            )
            THEN (
                SELECT CAST(Answer AS INT)
                FROM ASSESSMENT_ANSWER AA 
                JOIN ASSESSMENT_QUESTIONS AQ ON AA.QuestionID = AQ.QuestionID
                WHERE RecordID = @RecordID AND PatientID = @PatientID AND AQ.QuestionFor = 'GAF Score'
            )
            ELSE 0
        END;

        -- Update the PsychiatricScore in HEALTH_RECORD table
        UPDATE HEALTH_RECORD
        SET PsychiatricScore = CAST(@TotalScore AS VARCHAR(15))
        WHERE RecordID = @RecordID;

        FETCH NEXT FROM cur INTO @RecordID, @PatientID;
    END;

    CLOSE cur;
    DEALLOCATE cur;
END;