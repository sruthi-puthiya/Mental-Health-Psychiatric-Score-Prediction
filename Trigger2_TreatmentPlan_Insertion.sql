CREATE TRIGGER trg_AssignTreatmentPlan  
ON HEALTH_RECORD
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the PsychiatricScore field was updated
    IF NOT UPDATE(PsychiatricScore)
        RETURN; -- Exit the trigger if PsychiatricScore was not updated

    -- Declare variables to hold intermediate data
    DECLARE @PatientID INT, @Score INT, @RecordID INT, @ProviderID INT, @PlanName VARCHAR(100),@ConsultationDuration int;

    -- Fetch the new/updated data
    SELECT 
        @PatientID = PatientID, 
        @Score = CAST(PsychiatricScore AS INT), 
        @RecordID = RecordID
    FROM inserted;

    -- Check if the PsychiatricScore is valid and assign plans/providers based on rules
    IF @Score >= 91 AND @Score <= 100
    BEGIN
        -- Assign a counselor (randomly chosen)
        SELECT TOP 1 @ProviderID = ProviderID 
        FROM PROVIDER
        WHERE Specialization = 'Counselor'
        ORDER BY NEWID();
		SET @ConsultationDuration=2
        SET @PlanName = 'General Counseling';
    END
    ELSE IF @Score >= 81 AND @Score <= 90
    BEGIN
        -- Assign a therapist (randomly chosen)
        SELECT TOP 1 @ProviderID = ProviderID
        FROM PROVIDER
        WHERE Specialization = 'Therapist'
        ORDER BY NEWID();
		SET @ConsultationDuration=2
        SET @PlanName = 'Mild Anxiety Disorder';
    END
	ELSE IF @Score >= 71 AND @Score<=80
    BEGIN
        -- Assign Cognitive Behavioral Therapy or similar treatment plan (randomly chosen therapist)
        SELECT TOP 1 @ProviderID = ProviderID
        FROM PROVIDER
        WHERE Specialization = 'Psychologist'
        ORDER BY NEWID(); -- Randomly select a therapist
		SET @ConsultationDuration=2
        SET @PlanName = 'Generalized Anxiety Disorder';
    END
	ELSE IF @Score >= 61 AND @Score<=70
    BEGIN
        -- Assign Cognitive Behavioral Therapy or similar treatment plan (randomly chosen therapist)
        SELECT TOP 1 @ProviderID = ProviderID
        FROM PROVIDER
        WHERE Specialization = 'Psychiatrist'
        ORDER BY NEWID(); -- Randomly select a therapist
		SET @ConsultationDuration=1
        SET @PlanName = 'Depression';
    END
	ELSE IF @Score >= 51 AND @Score<=60
    BEGIN
        -- Assign Cognitive Behavioral Therapy or similar treatment plan (randomly chosen therapist)
        SELECT TOP 1 @ProviderID = ProviderID
        FROM PROVIDER
        WHERE Specialization = 'Psychiatrist'
        ORDER BY NEWID(); -- Randomly select a therapist
		SET @ConsultationDuration=5
        SET @PlanName = 'Bipolar Disorder';
    END
	ELSE IF @Score >= 41 AND @Score<=50
    BEGIN
        -- Assign Cognitive Behavioral Therapy or similar treatment plan (randomly chosen therapist)
        SELECT TOP 1 @ProviderID = ProviderID
        FROM PROVIDER
        WHERE Specialization = 'Psychiatrist'
        ORDER BY NEWID(); -- Randomly select a therapist
		SET @ConsultationDuration=3
        SET @PlanName = 'PTSD';
    END
	ELSE IF @Score >= 31 AND @Score<=40
    BEGIN
        -- Assign Cognitive Behavioral Therapy or similar treatment plan (randomly chosen therapist)
        SELECT TOP 1 @ProviderID = ProviderID
        FROM PROVIDER
        WHERE Specialization = 'Psychiatrist'
        ORDER BY NEWID(); -- Randomly select a therapist
		SET @ConsultationDuration=5
        SET @PlanName = 'Bipolar Disorder with Psychotic';
    END
	ELSE IF @Score >= 21 AND @Score<=30
    BEGIN
        -- Assign Cognitive Behavioral Therapy or similar treatment plan (randomly chosen therapist)
        SELECT TOP 1 @ProviderID = ProviderID
        FROM PROVIDER
        WHERE Specialization = 'Psychiatrist'
        ORDER BY NEWID(); -- Randomly select a therapist
		SET @ConsultationDuration=3
        SET @PlanName = 'Severe Personality Disorders';
    END
	ELSE IF @Score >= 11 AND @Score<=20
    BEGIN
        -- Assign Cognitive Behavioral Therapy or similar treatment plan (randomly chosen therapist)
        SELECT TOP 1 @ProviderID = ProviderID
        FROM PROVIDER
        WHERE Specialization = 'Medical Provider'
        ORDER BY NEWID(); -- Randomly select a therapist
		SET @ConsultationDuration=48
        SET @PlanName = 'Hospitalization';
    END
	ELSE IF @Score >= 1 AND @Score<=10
    BEGIN
        -- Assign Cognitive Behavioral Therapy or similar treatment plan (randomly chosen therapist)
        SELECT TOP 1 @ProviderID = ProviderID
        FROM PROVIDER
        WHERE Specialization = 'Medical Provider'
        ORDER BY NEWID(); -- Randomly select a therapist
		SET @ConsultationDuration=200
        SET @PlanName = 'Emegency-Hospitalize';
    END
	ELSE IF @Score =0 or @Score is NULL
    BEGIN
         PRINT 'No illness,unable to assign provider.';
    END
    -- Add more conditions for other ranges as per the logic provided...

    -- Check if a valid provider was found
    IF @ProviderID IS NOT NULL
    BEGIN
        -- Check if the treatment plan already exists
        IF EXISTS (SELECT 1 FROM Treatment_plan WHERE PatientID = @PatientID AND RecordID = @RecordID)
        BEGIN
            -- Update the existing treatment plan
            UPDATE Treatment_plan
            SET 
                ProviderID = @ProviderID,
                TreatmentPlanName = @PlanName,
                StartDate = GETDATE(),
				ConsultationDuration=@ConsultationDuration,
                TreatmentGoals = 'Re-evaluated based on PHQ-9/GAF guidelines',
                FollowUpStatus = 'Active'
            WHERE 
                PatientID = @PatientID AND RecordID = @RecordID;
        END
        ELSE
        BEGIN
            -- Insert a new treatment plan
            INSERT INTO Treatment_plan (
                PatientID,
                ProviderID,
                RecordID,
                TreatmentPlanName,
                StartDate,
				ConsultationDuration,
                TreatmentGoals,
                FollowUpStatus
            )
            VALUES (
                @PatientID,
                @ProviderID,
                @RecordID,
                @PlanName,
                GETDATE(),
				@ConsultationDuration,
                'Re-evaluated based on PHQ-9/GAF guidelines',
                'Active'
            );
        END
    END
    ELSE
    BEGIN
        -- Log or handle the case where no provider was found
        PRINT 'No provider found for the specified specialization. Unable to assign treatment plan.';
    END
END;
