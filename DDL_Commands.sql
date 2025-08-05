------------------------------PATIENT table created
CREATE TABLE PATIENT (
    PatientID INT IDENTITY(1,1) PRIMARY KEY,
    PatientFirstName VARCHAR(50) NOT NULL,
    PatientLastName VARCHAR(50) NOT NULL,
    PatientDOB DATE NOT NULL,
    PatientGender VARCHAR(10) CHECK (PatientGender IN ('Male', 'Female', 'Other')),
    PatientEmail VARCHAR(100),
    PatientPhone VARCHAR(15),
    PatientConsultationStartDate DATE NOT NULL,
    EmergencyContactName VARCHAR(30),
    EmergencyContactPhone VARCHAR(15),
    EmergencyContactRelationship VARCHAR(20));

------------------------------HEALTH_RECORD table created
CREATE TABLE HEALTH_RECORD (
    RecordID INT IDENTITY(1,1) PRIMARY KEY,
    PatientID INT NOT NULL,
    PsychiatricScore VARCHAR(15) DEFAULT NULL,
    AssessmentDate DATE NOT NULL,
    PhysicalHealthIssues VARCHAR(50),
    SafetyConcerns VARCHAR(50),
    FOREIGN KEY (AssessmentPatientID) REFERENCES PATIENT(PatientID) ON DELETE CASCADE);

------------------------------ASSESSMENT_QUESTIONS table created
CREATE TABLE ASSESSMENT_QUESTIONS (
    QuestionID VARCHAR(3) PRIMARY KEY,
    Question VARCHAR(300) NOT NULL,
    Option1 VARCHAR(300),
    Option2 VARCHAR(300),
    Option3 VARCHAR(300),
    Option4 VARCHAR(300),
    QuestionFor VARCHAR(50) NOT NULL);
	
------------------------------ASSESSMENT_ANSWER table created
CREATE TABLE Assessment_Answer (
    RecordID INT NOT NULL,
    QuestionID VARCHAR(3) NOT NULL,
    PatientID INT NOT NULL,
    Answer VARCHAR(300),
	Primary key(RecordID,QuestionID,PatientID),
    FOREIGN KEY (RecordID) REFERENCES HEALTH_RECORD(RecordID),
    FOREIGN KEY (PatientID) REFERENCES PATIENT(PatientID) ON DELETE CASCADE,
    FOREIGN KEY (QuestionID) REFERENCES ASSESSMENT_QUESTIONS(QuestionID));

------------------------------ILLNESS_LIST table created
CREATE TABLE ILLNESS_LIST (
    IllnessID INT IDENTITY(1,1) PRIMARY KEY,
    IllnessName VARCHAR(300) NOT NULL,
    IllnessDescription VARCHAR(300),
    IllnessSymptoms VARCHAR(300),
    PredefinedScore INT);


------------------------------MEDICINE_LIST table created
CREATE TABLE MEDICINE_LIST (
    MedicineID INT IDENTITY(1,1) PRIMARY KEY,
    MedicineName VARCHAR(50) NOT NULL,
    MedicineDescription VARCHAR(300),
    MedicineUses VARCHAR(200),
    MedicineSideEffects VARCHAR(200));


------------------------------THERAPY_LIST table created
CREATE TABLE THERAPY_LIST (
    TherapyID INT IDENTITY(1,1) PRIMARY KEY,
    TherapyName VARCHAR(50) NOT NULL,
    TherapyDescription VARCHAR(300),
    TherapyEffectiveness VARCHAR(10));


------------------------------PROVIDER table created
CREATE TABLE PROVIDER (
    ProviderID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    ContactInfo VARCHAR(100),
    Specialization VARCHAR(50),
    LicenceCertificationNumber VARCHAR(20),
    YearsExperience INT CHECK (YearsExperience >= 0),
    MedicalSchool VARCHAR(100));

	
------------------------------TREATMENT_PLAN table created
CREATE TABLE Treatment_plan (
    PatientID INT NOT NULL,
	ProviderID INT NOT NULL,
    RecordID INT NOT NULL,
	TreatmentPlanName VARCHAR(200),
    StartDate DATE NOT NULL,
    ConsultationDuration INT CHECK (ConsultationDuration > 0),
    TreatmentGoals VARCHAR(200),
	FollowUpStatus VARCHAR(100) 
	CHECK (FollowUpStatus IN ('Active', 'Inactive', 'Removed', 'In Emergency Ward', 'Hospitalized')),
	Primary KEY(ProviderID,RecordID,PatientID),
    FOREIGN KEY (PatientID) REFERENCES PATIENT(PatientID) ON DELETE CASCADE,
    FOREIGN KEY (ProviderID) REFERENCES PROVIDER(ProviderID),
    FOREIGN KEY (RecordID) REFERENCES HEALTH_RECORD(RecordID));
	--select * from Treatment_plan
	
------------------------------PATIENT_ILLNESS table created
CREATE TABLE Patient_Illness (
    PatientID INT NOT NULL,
    IllnessID INT NOT NULL,
    ProviderID INT NOT NULL,
    DiagnosisDate DATE NOT NULL,
    TreatmentNotes VARCHAR(255),
	Primary key(PatientID,ProviderID,IllnessID),
    FOREIGN KEY (PatientID) REFERENCES PATIENT(PatientID) ON DELETE CASCADE,
    FOREIGN KEY (IllnessID) REFERENCES ILLNESS_LIST(IllnessID) ,
    FOREIGN KEY (ProviderID) REFERENCES PROVIDER(ProviderID));
	
------------------------------ PATIENT_MEDICATION created
CREATE TABLE Patient_Medication (
    PatientID INT NOT NULL,
    ProviderID INT NOT NULL,
    MedicineID INT NOT NULL,
    Quantity INT CHECK (Quantity > 0),
    StartDate DATE NOT NULL,
	PRIMARY KEY(PatientID,ProviderID,MedicineID),
    FOREIGN KEY (PatientID) REFERENCES PATIENT(PatientID) ON DELETE CASCADE,
    FOREIGN KEY (ProviderID) REFERENCES PROVIDER(ProviderID), 
    FOREIGN KEY (MedicineID) REFERENCES MEDICINE_LIST(MedicineID));
	

------------------------------ PATIENT_THERAPY created
CREATE TABLE Patient_Therapy (
    TherapyID INT NOT NULL,
    PatientID INT NOT NULL,
    ProviderID INT NOT NULL,
    StartDate DATE NOT NULL,
    LastVisitDate DATE,
    Note VARCHAR(300),
	PRIMARY KEY(PatientID,ProviderID,TherapyID),
    FOREIGN KEY (TherapyID) REFERENCES THERAPY_LIST(TherapyID),
    FOREIGN KEY (PatientID) REFERENCES PATIENT(PatientID) ON DELETE CASCADE,
    FOREIGN KEY (ProviderID) REFERENCES PROVIDER(ProviderID));
	

