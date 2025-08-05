------------------------------------------Insert values into ASSESSMENT_QUESTIONS
insert into ASSESSMENT_QUESTIONS(QuestionID,Question,Option1,Option2,Option3,Option4,QuestionFor) values
('Q1','Little interest or pleasure in doing things.','Not at all','Several days','More than half the days','Nearly everyday','PHQ-9'),
('Q2','Moving or speaking so slowly that other people could have noticed? Or the opposite- feeling restless','Not at all','Several days','More than half the days','Nearly everyday','PHQ-9'),
('Q3','Feeling down, depressed or hopeless.','Not at all','Several days','More than half the days','Nearly everyday','PHQ-9'),
('Q4','Trouble falling asleep, staying asleep, or sleeping too much.','Not at all','Several days','More than half the days','Nearly everyday','PHQ-9'),
('Q5','Feeling tired or having little energy.','Not at all','Several days','More than half the days','Nearly everyday','PHQ-9'),
('Q6','Poor appetite or overeating.','Not at all','Several days','More than half the days','Nearly everyday','PHQ-9'),
('Q7','Feeling bad about yourself - or that you are a failure or have let yourself or your family down.','Not at all','Several days','More than half the days','Nearly everyday','PHQ-9'),
('Q8','Trouble concentrating on things, such as reading the newspaper or watching television.','Not at all','Several days','More than half the days','Nearly everyday','PHQ-9'),
('Q9','Thoughts that you would be better off dead or of hurting yourself in some way.','Not at all','Several days','More than half the days','Nearly everyday','PHQ-9'),
('Q10','Superior functioning in a wide range of activities, life’s problems never seem to get out of hand, is sought out by others because of his or her many positive qualities.','91-100',Null,null,null,'GAF Score'),
('Q11','Absent or minimal symptoms (e.g., mild anxiety before an exam), good functioning in all areas, interested and involved in a wide range of activities. socially effective, generally satisfied with life, no more than everyday problems or concerns (e.g. an occasional argument with family members). ','81-90',null,null,null,'GAF Score'),
('Q12','If symptoms are present, they are transient and expectable reactions to psychosocial stressors (e.g., difficulty concentrating after family argument); nomore than slight impairment in social, occupational or school functioning (e.g., temporarily failing behind in schoolwork).','71-80',null,null,null,'GAF Score'),
('Q13','Some mild symptoms (e.g. depressed mood and mild insomnia) OR some difficulty in social, occupational, or school functioning (e.g., occasional truancy, or theft within the household), but generally functioning pretty well, has some meaningful interpersonal relationships.','61-70',null,null,null,'GAF Score'),
('Q14','Moderate symptoms (e.g., flat affect and circumstantial speech, occasional panic attacks) OR moderate difficulty in social, occupational, or school functioning (e.g.. few friends, conflicts with peers or co-workers). ','51-60',null,null,null,'GAF Score'),
('Q15','Serious symptoms (e.g.. suicidal ideation, severe obsessional rituals, frequent shoplifting) OR any serious impairment in social, occupational, or school functioning (e.g., no friends, unable to keep a job). ','41-50',null,null,null,'GAF Score'),
('Q16','Some danger of harming self or others, severe impairment in functioning, requires immediate intervention.','31-40',null,null,null,'GAF Score'),
('Q17','Constant danger of harming self or others, inability to function independently, requires hospitalization.','21-30',null,null,null,'GAF Score'),
('Q18','Persistent danger of harming self or others, inability to communicate, requires constant supervision and intervention','1-20',null,null,null,'GAF Score');

------------------------------------------Insert values into ILLNESS_LIST
INSERT INTO ILLNESS_LIST (IllnessName, IllnessDescription, IllnessSymptoms, PredefinedScore)VALUES 
('Major Depressive Disorder', 'A mood disorder with sadness and loss of interest.', 'Sadness, fatigue, loss of interest, appetite changes', 50),
('Generalized Anxiety Disorder', 'Excessive worry about various aspects of life.', 'Restlessness, fatigue, irritability, muscle tension', 60),
('Post-Traumatic Stress Disorder', 'Mental health condition from a traumatic event.', 'Flashbacks, nightmares, severe anxiety', 55),
('Bipolar Disorder', 'Mental illness with extreme mood swings.', 'Mood swings, irritability, hyperactivity', 45),
('Obsessive-Compulsive Disorder', 'Recurrent unwanted thoughts and behaviors.', 'Repetitive behaviors, anxiety, distress', 40),
('Schizophrenia', 'Mental disorder with hallucinations and delusions.', 'Hallucinations, delusions, social withdrawal', 30),
('Panic Disorder', 'Anxiety disorder with unexpected panic attacks.', 'Intense fear, palpitations, shaking', 50),
('Social Anxiety Disorder', 'Anxiety in social interactions.', 'Fear of social situations, self-consciousness', 65),
('Persistent Depressive Disorder', 'Long-term form of depression.', 'Chronic low mood, fatigue, low self-esteem', 40),
('Eating Disorders', 'Abnormal eating habits affecting health.', 'Food preoccupation, body weight changes', 45),
('Borderline Personality Disorder', 'Unstable moods, behavior, and relationships.', 'Anger, depression, fear of abandonment', 35),
('Attention-Deficit Hyperactivity Disorder', 'Inattention and hyperactivity.', 'Inattention, hyperactivity, impulsiveness', 50),
('Substance Use Disorder', 'Clinically significant impairment from substance use.', 'Compulsive use, social problems, withdrawal', 30),
('Anxiety Disorders', 'High levels of fear and anxiety.', 'Excessive fear, anxiety, panic attacks', 55),
('Dissociative Disorders', 'Disruptions in memory, awareness, identity.', 'Amnesia, depersonalization, derealization', 40),
('Mood Disorders', 'Emotional highs and lows.', 'Depression, mania, bipolar disorder', 35),
('Personality Disorders', 'Enduring patterns of behavior and cognition.', 'Unstable relationships, impulsive actions', 30),
('Neurodevelopmental Disorders', 'Affecting the nervous system development.', 'Autism, ADHD', 55),
('Trauma and Stressor-Related Disorders', 'Triggered by traumatic events.', 'PTSD, acute stress, adjustment disorders', 50),
('Substance-Related Disorders', 'Impairment from substance use.', 'Alcohol use disorder, drug addiction', 40),
('Obsessive-Compulsive Disorders', 'Obsessive thoughts and behaviors.', 'OCD, body dysmorphic disorder', 45),
('Psychotic Disorders', 'Distorted thinking and perceptions.', 'Schizophrenia, delusional disorder', 30),
('Eating Disorders', 'Abnormal eating habits.', 'Anorexia, bulimia, binge-eating', 50),
('Neurocognitive Disorders', 'Cognitive function impairment.', 'Dementia, mild cognitive impairment', 35),
('Paraphilic Disorders', 'Atypical sexual interests.', 'Fetishistic, voyeuristic disorder', 20),
('Other Mental Disorders', 'Unspecified mental disorders.', 'Other anxiety, trauma-related disorder', 25);

------------------------------------------Insert values into MEDICINE_LIST
INSERT INTO MEDICINE_LIST (MedicineName, MedicineDescription, MedicineUses, MedicineSideEffects) VALUES
('Fluoxetine', 'SSRI for depression.', 'Major Depressive, anxiety disorders', 'Insomnia, nausea, sexual dysfunction'),
('Sertraline', 'SSRI for depression and anxiety.', 'Major Depressive, Generalized Anxiety', 'Nausea, diarrhea, dizziness'),
('Lithium', 'Mood stabilizer for bipolar.', 'Bipolar Disorder, Mania', 'Weight gain, tremors, thirst'),
('Risperidone', 'Antipsychotic for schizophrenia, bipolar.', 'Schizophrenia, Bipolar Disorder', 'Weight gain, drowsiness, cholesterol'),
('Olanzapine', 'Atypical antipsychotic.', 'Schizophrenia, Bipolar Disorder', 'Weight gain, dizziness, dry mouth'),
('Quetiapine', 'Atypical antipsychotic.', 'Schizophrenia, Bipolar, Major Depressive', 'Drowsiness, dry mouth, constipation'),
('Aripiprazole', 'Atypical antipsychotic.', 'Schizophrenia, Bipolar, Major Depressive', 'Headache, nausea, anxiety'),
('Haloperidol', 'Typical antipsychotic.', 'Schizophrenia, Acute Psychotic States', 'Drowsiness, muscle stiffness, tremors'),
('Clozapine', 'Atypical antipsychotic.', 'Treatment-Resistant Schizophrenia', 'Weight gain, drooling, seizures'),
('Lamotrigine', 'Mood stabilizer for bipolar.', 'Bipolar Disorder, Epilepsy', 'Dizziness, headache, blurred vision'),
('Valproate', 'Mood stabilizer and anticonvulsant.', 'Bipolar Disorder, Epilepsy', 'Weight gain, hair loss, tremors'),
('Escitalopram', 'SSRI for depression, anxiety.', 'Major Depressive, Generalized Anxiety', 'Nausea, insomnia, sexual dysfunction'),
('Venlafaxine', 'SNRI for depression, anxiety.', 'Major Depressive, Anxiety Disorders', 'Blood pressure, dizziness, insomnia'),
('Bupropion', 'Atypical antidepressant.', 'Major Depressive, Seasonal Affective', 'Dry mouth, insomnia, headache'),
('Mirtazapine', 'Atypical antidepressant.', 'Major Depressive Disorder', 'Weight gain, drowsiness, dry mouth'),
('Paroxetine', 'SSRI for depression, OCD, anxiety.', 'Major Depressive, OCD, Anxiety Disorders', 'Nausea, sexual dysfunction, dizziness'),
('Citalopram', 'SSRI for depression, anxiety.', 'Major Depressive, Anxiety Disorders', 'Nausea, sexual dysfunction, dizziness');

------------------------------------------Insert values into THERAPY_LIST
INSERT INTO THERAPY_LIST (TherapyName,TherapyDescription,TherapyEffectiveness) VALUES
('Supportive Therapy', 'Provides emotional support and helps patients develop coping strategies.', 'Moderate'),
('Cognitive Behavioral Therapy (CBT)', 'Focuses on changing negative thought patterns and behaviors.', 'High'),
('Antidepressant Medication', 'Prescribed to treat depression by balancing chemicals in the brain.', 'High'),
('Psychotherapy', 'Involves talking with a therapist to understand and manage emotions.', 'Moderate'),
('Individual Therapy', 'One-on-one sessions with a therapist to address personal issues.', 'Moderate'),
('Group Therapy', 'Therapy conducted with groups of people facing similar issues.', 'Moderate'),
('Family Therapy', 'Involves family members to improve communication and resolve conflicts.', 'Moderate'),
('Medication Management', 'Regular monitoring and adjustment of medications.', 'High'),
('Antipsychotic Medication', 'Prescribed to manage symptoms of psychosis.', 'High'),
('Psychoeducation', 'Educates patients and families about mental health conditions.', 'Moderate'),
('Behavioral Therapy', 'Focuses on changing harmful behaviors through various techniques.', 'Moderate'),
('Social Skills Training', 'Teaches patients how to interact effectively with others.', 'Moderate'),
('Exposure Therapy','Exposure to fear source in a controlled setting to reduce response','Moderate'),
('Acceptance and Commitment Therapy (ACT)', 'Uses mindfulness and behavior strategies to help patients accept thoughts and feelings.', 'Moderate'),
('Interpersonal Therapy (IPT)', 'Improves relationships and social functioning to reduce depression symptoms.', 'High'),
('Family Therapy', 'Helps family members communicate and resolve conflicts.', 'Moderate'),
('Cognitive Behavioral Therapy (CBT)', 'Helps patients change negative thinking and behavior patterns.', 'High'),
('Dialectical Behavior Therapy (DBT)', 'Balances acceptance and change, used for borderline personality disorder.', 'High');
------------------------------------------Insert values into PROVIDER
INSERT INTO Provider (FirstName, LastName, ContactInfo, Specialization,LicenceCertificationNumber,YearsExperience,MedicalSchool) VALUES
('Alice', 'Smith', 'alice.smith@example.com', 'Psychologist','PSY12345', 10, 'Harvard University'),
('Bob', 'Johnson', 'bob.johnson@example.com', 'Therapist','PSY67890', 5, 'Stanford University'),
('Carol', 'Williams', 'carol.williams@example.com', 'Psychiatrist','THER12345', 8, 'Cognitive Behavioral Therapy'),
('David', 'Jones', 'david.jones@example.com', 'Medical Provider','THER67890', 4, 'Family Therapy'),
('Eve', 'Brown', 'eve.brown@example.com', 'Counselor','PSYCH12345', 12, 'Johns Hopkins University'),
('Theresa', 'Smith', 'theresa.smith@example.com', 'Psychologist','PSYCH67890', 6, 'Yale University'),
('Ken', 'Johnson', 'ken.johnson@example.com', 'Therapist','MED12345', 15, 'General Medicine'),
('Michel', 'Williams', 'michel.williams@example.com', 'Psychiatrist','MED67890', 7, 'Pediatrics'),
('Colon', 'Jones', 'colon.jones@example.com', 'Medical Provider','COUN12345', 9, 'Humanistic Approach'),
('Manasi', 'Brown', 'manasi.brown@example.com', 'Counselor','COUN67890', 3, 'Solution-Focused Brief Therapy'),
('Aaron', 'Beck', 'aaron.beck@example.com', 'Psychiatrist', 'LIC123456', 40, 'Yale School of Medicine'),
('Martin', 'Seligman', 'martin.seligman@example.com', 'Psychologist', 'LIC654321', 35, 'University of Pennsylvania'),
('Virginia', 'Satir', 'virginia.satir@example.com', 'Therapist', 'LIC987654', 30, 'University of Chicago'),
('Albert', 'Bandura', 'albert.bandura@example.com', 'Counselor', 'LIC876543', 45, 'University of Iowa'),
('Atul', 'Gawande', 'atul.gawande@example.com', 'Medical Provider', 'LIC192837', 25, 'Harvard Medical School'),
('Catherine', 'Rogers', 'catherine.rogers@example.com', 'Psychiatrist', 'LIC345678', 20, 'Stanford University School of Medicine'),
('Elizabeth', 'Harris', 'elizabeth.harris@example.com', 'Psychologist', 'LIC876210', 28, 'Duke University'),
('Richard', 'Carlson', 'richard.carlson@example.com', 'Therapist', 'LIC213456', 15, 'University of California, Los Angeles'),
('Patricia', 'Garcia', 'patricia.garcia@example.com', 'Counselor', 'LIC098765', 22, 'University of Southern California'),
('Thomas', 'Nguyen', 'thomas.nguyen@example.com', 'Medical Provider', 'LIC765432', 18, 'Johns Hopkins University'),
('Nancy', 'Taylor', 'nancy.taylor@example.com', 'Psychiatrist', 'LIC564738', 26, 'New York University'),
('Peter', 'Martin', 'peter.martin@example.com', 'Psychologist', 'LIC483726', 32, 'Columbia University'),
('Susan', 'Lee', 'susan.lee@example.com', 'Therapist', 'LIC294857', 17, 'University of Michigan'),
('George', 'Clark', 'george.clark@example.com', 'Counselor', 'LIC372615', 21, 'Vanderbilt University'),
('Lisa', 'Walker', 'lisa.walker@example.com', 'Medical Provider', 'LIC487263', 14, 'University of California, San Francisco'),
('Karen', 'Thompson', 'karen.thompson@example.com', 'Psychiatrist', 'LIC758492', 19, 'Northwestern University'),
('John', 'Lewis', 'john.lewis@example.com', 'Psychologist', 'LIC846291', 33, 'Brown University'),
('Jennifer', 'Hall', 'jennifer.hall@example.com', 'Therapist', 'LIC926375', 20, 'University of North Carolina'),
('Robert', 'Allen', 'robert.allen@example.com', 'Counselor', 'LIC739182', 24, 'Boston University'),
('Sarah', 'Scott', 'sarah.scott@example.com', 'Medical Provider', 'LIC926473', 29, 'University of Washington'),
('Matthew', 'Young', 'matthew.young@example.com', 'Psychiatrist', 'LIC517364', 27, 'University of Virginia'),
('Jessica', 'Adams', 'jessica.adams@example.com', 'Psychologist', 'LIC264819', 31, 'Cornell University'),
('Brian', 'Nelson', 'brian.nelson@example.com', 'Therapist', 'LIC948273', 23, 'University of Florida'),
('Laura', 'Perez', 'laura.perez@example.com', 'Counselor', 'LIC274869', 16, 'University of Texas'),
('Daniel', 'Roberts', 'daniel.roberts@example.com', 'Medical Provider', 'LIC591827', 30, 'University of Chicago'),
('Emily', 'King', 'emily.king@example.com', 'Psychiatrist', 'LIC716283', 24, 'Emory University'),
('Michael', 'White', 'michael.white@example.com', 'Psychologist', 'LIC498375', 35, 'University of Miami'),
('Amanda', 'Green', 'amanda.green@example.com', 'Therapist', 'LIC917284', 25, 'University of Maryland'),
('Kevin', 'Moore', 'kevin.moore@example.com', 'Counselor', 'LIC738192', 22, 'University of Wisconsin'),
('Maria', 'Taylor', 'maria.taylor@example.com', 'Medical Provider', 'LIC847162', 28, 'University of Minnesota'),
('Charles', 'Martinez', 'charles.martinez@example.com', 'Psychiatrist', 'LIC652834', 34, 'University of Pittsburgh'),
('Barbara', 'Jackson', 'barbara.jackson@example.com', 'Psychologist', 'LIC928374', 29, 'University of Alabama'),
('Paul', 'Hernandez', 'paul.hernandez@example.com', 'Therapist', 'LIC819263', 18, 'University of Kansas'),
('Linda', 'Lopez', 'linda.lopez@example.com', 'Counselor', 'LIC273849', 27, 'University of Oklahoma'),
('Mark', 'Gonzalez', 'mark.gonzalez@example.com', 'Medical Provider', 'LIC564739', 26, 'University of Arizona'),
('James', 'Harris', 'james.harris@example.com', 'Psychiatrist', 'LIC417263', 23, 'University of Illinois'),
('Carol', 'Clark', 'carol.clark@example.com', 'Psychologist', 'LIC738192', 32, 'University of Colorado'),
('David', 'Lewis', 'david.lewis@example.com', 'Therapist', 'LIC274639', 20, 'University of Kentucky'),
('Patricia', 'Hall', 'patricia.hall@example.com', 'Counselor', 'LIC628473', 19, 'University of Nebraska'),
('Steven', 'Allen', 'steven.allen@example.com', 'Medical Provider', 'LIC384716', 17, 'University of Missouri');
------------------------------------------Insert values into PATIENT
INSERT INTO PATIENT (PatientFirstName, PatientLastName, PatientDOB, PatientGender, PatientEmail, PatientPhone, PatientConsultationStartDate, 
EmergencyContactName, EmergencyContactPhone, EmergencyContactRelationship) VALUES
('Alice', 'Smith', '1985-05-15', 'Female', 'alice.smith@example.com', '123-456-7890', '2024-01-10', 'John Smith', '321-654-0987', 'Brother'),
('Bob', 'Jones', '1978-02-20', 'Male', 'bob.jones@example.com', '987-654-3210', '2024-02-15', 'Mary Jones', '654-321-0987', 'Sister'),
('Carol', 'White', '1990-07-30', 'Female', 'carol.white@example.com', '456-789-1234', '2024-03-20', 'Tom White', '789-123-4567', 'Husband'),
('David', 'Black', '1982-11-05', 'Male', 'david.black@example.com', '321-654-7890', '2024-04-12', 'Emily Black', '654-321-7890', 'Wife'),
('Emma', 'Brown', '1995-09-23', 'Female', 'emma.brown@example.com', '654-789-3210', '2024-05-18', 'Lucas Brown', '789-654-3210', 'Brother'),
('Frank', 'Green', '1975-12-08', 'Male', 'frank.green@example.com', '987-321-6540', '2024-06-22', 'Nancy Green', '321-987-6540', 'Wife'),
('Grace', 'Hall', '1988-03-15', 'Female', 'grace.hall@example.com', '456-123-7890', '2024-07-28', 'Olivia Hall', '123-456-7890', 'Sister'),
('Hannah', 'Young', '1984-04-27', 'Female', 'hannah.young@example.com', '789-654-1230', '2024-08-31', 'Jacob Young', '654-789-1230', 'Husband'),
('Isaac', 'King', '1993-06-14', 'Male', 'isaac.king@example.com', '321-123-4560', '2024-09-19', 'Sophia King', '123-321-4560', 'Sister'),
('Julia', 'Lee', '1991-01-11', 'Female', 'julia.lee@example.com', '654-321-9870', '2024-10-25', 'Michael Lee', '321-654-9870', 'Brother'),
('John', 'Doe', '1985-06-15', 'Male', 'john.doe@example.com', null, '2023-11-01', null,null,null),
('Emma', 'Watson', '1990-04-12', 'Female', 'emma.watson@example.com', '2345678901', '2023-11-05', 'Ethan Watson', '1234567891', 'Sibling'),
('Liam', 'Smith', '1978-09-25', 'Male', 'liam.smith@example.com', '3456789012', '2023-10-20', 'Olivia Smith', '2345678902', 'Parent'),
('Sophia', 'Brown', '1995-03-18', 'Female', 'sophia.brown@example.com', null, '2023-10-15', 'Ava Brown', '3456789013', 'Friend'),
('Noah', 'Jones', '2000-12-05', 'Male', 'noah.jones@example.com', '5678901234', '2023-09-10', 'Liam Jones', '4567890124', 'Parent'),
('Isabella', 'Taylor', '1988-11-22', 'Female', 'isabella.taylor@example.com', '6789012345', '2023-11-01', null,null,null),
('Mason', 'Wilson', '1975-07-10', 'Male', 'mason.wilson@example.com', '7890123456', '2023-08-20', 'Emily Wilson', '6789012346', 'Spouse'),
('Olivia', 'White', '1992-01-30', 'Female', 'olivia.white@example.com', '8901234567', '2023-10-12', 'Charlotte White', '7890123457', 'Parent'),
('Elijah', 'Harris', '1982-05-16', 'Male', 'elijah.harris@example.com', '9012345678', '2023-09-25', 'Amelia Harris', '8901234568', 'Sibling'),
('Ava', 'Clark', '1998-06-09', 'Female', 'ava.clark@example.com', null, '2023-11-18', 'Sophia Clark', '9012345679', 'Friend'),
('Lucas', 'Hall', '1984-03-12', 'Male', 'lucas.hall@example.com', '2345609876', '2023-09-30', 'Emma Hall', '0123456789', 'Parent'),
('Charlotte', 'Allen', '1996-08-25', 'Female', 'charlotte.allen@example.com', '3456709876', '2023-11-11', null, null, null),
('Benjamin', 'Young', '1991-10-14', 'Male', 'benjamin.young@example.com', '4567809876', '2023-10-05', 'Evelyn Young', '2345678901', 'Spouse'),
('Amelia', 'King', '1973-12-31', 'Female', 'amelia.king@example.com', '5678909876', '2023-07-20', 'Oliver King', '3456789012', 'Friend'),
('James', 'Wright', '1989-02-20', 'Male', 'james.wright@example.com', '6789010987', '2023-10-25', 'William Wright', '4567890123', 'Parent');

select * from PATIENT
select * from HEALTH_RECORD
------------------------------------------Insert values into HEALTH_RECORD
INSERT INTO HEALTH_RECORD(PAtientID,AssessmentDate,PhysicalHealthIssues,SafetyConcerns) VALUES
(1,  '2024-01-10', 'None',			'None'),								
(2,  '2024-02-15', 'Diabetes',		'None'),
(3,  '2024-03-20', 'Hypertension',	'Fall Risk'),				
(4,  '2024-04-12', 'Asthma',		'None'),
(5,  '2024-05-18', 'None',			'None'),								
(6,  '2024-06-22', 'Arthritis',		'None'),
(7,  '2024-07-28', 'Heart Disease', 'None'),					
(8,  '2024-08-31', 'None',			'None'),
(9,  '2024-09-19', 'Diabetes',		'Fall Risk'),					
(10, '2024-10-25', 'None',			'None'),
(11, '2024-01-05', 'Cancer',		'None'),							
(12, '2024-02-08', 'Hypertension',	'Fall Risk'),
(13, '2024-03-15', 'Cancer',		'None'),							
(14, '2024-04-21', 'Diabetes',		'None'),
(15, '2024-05-10', 'Asthma',		'None'),							
(16, '2024-06-14', 'Cancer',		'Fall Risk'),
(17, '2024-07-19', 'Obesity',		'Fall Risk'),						
(18, '2024-08-27', 'Diabetes',		'None'),				
(19, '2024-09-12', 'Stroke/Brain Injury','Cognitive Decline'),	
(20, '2024-10-01', 'Cancer',		'Immune Suppression'),	
(21, '2024-01-20', 'None',			'Fall Risk'),						
(22, '2024-02-14', 'None',			'None'),					
(23, '2024-03-28', 'Heart Disease', 'Breathing Issues'),		
(24, '2024-04-06', 'Heart Disease', 'None'),		
(25, '2024-05-15', 'Heart Disease', 'None');


select * from Treatment_plan
select * from Assessment_Answer
select * from [dbo].[HEALTH_RECORD]
--update HEALTH_RECORD set psychiatricScore=NULL
select * from assessment_questions
select * from assessment_answer
delete from assessment_answer
select * from ILLNESS_LIST
------------------------------------------Insert values into Assessment_Answer
INSERT INTO ASSESSMENT_ANSWER (RecordID,QuestionID,PatientID,Answer) values
(12,'Q10',1,'91'),	(15,'Q12',4,'73'),	(16,'Q13',5,'65'),	(17,'Q14',6,'58'),
(18,'Q15',7,'43'),	(19,'Q16',8,'37'),	(22,'Q15',11,'45'),	(23,'Q13',12,'62'),
(24,'Q15',13,'45'),	(25,'Q11',14,'85'),	(26,'Q11',15,'85'),	(27,'Q15',16,'45'),
(28,'Q11',17,'82'),	(29,'Q11',18,'85'),	(30,'Q13',19,'65'),	(31,'Q15',20,'45'),
(32,'Q10',21,'92'),	(33,'Q10',22,'97'),	(34,'Q13',23,'68'),	(35,'Q13',24,'68'),
(36,'Q13',25,'68'),
(14,'Q1', 3,'Not at all'),		(14,'Q2',3,'Several days'),	(14,'Q3',3,'Several days'),
(14,'Q4', 3,'Several days'),	(14,'Q5',3,'Several days'),	(14,'Q6',3,'Several days'),

(13,'Q4',2,'Several days'),		(13,'Q5', 2,'More than half the days'),
(13,'Q6',2,'Several days'),		(13,'Q7',2,'Nearly everyday'),
(13,'Q1',2,'More than half the days'),(13,'Q2', 2,'Several days'),(13,'Q3',2,'Several days');


------------------------------------------Insert values into Treatment_plan
-------"Trigger does the job"
------------------------------------------Insert values into Patient_Illness
select * from Treatment_plan
select * from Patient_Illness
select * from ILLNESS_LIST --delete from Patient_Illness

insert into Patient_Illness(PatientID,ProviderID,IllnessID,DiagnosisDate,TreatmentNotes) values
(18	,18	, 2 ,'2023-09-09',  'GAD-fluxetine-therapy start later'),
(8	,19	, 4 ,'2023-06-09',  'Need observation'),
(21	,21	, 10 ,'2023-08-06',  'Started Counceling'),
(22	,21	, 16 ,'2023-05-02',  'Started counceling'),
(3	,25	, 24 ,'2023-04-03',  'Under observation'),
(1	,26	, 10 ,'2023-01-04',  'started counceling'),
(7	,27	, 3 ,'2023-09-05',  'Under medication'),
(19	,27	, 3 ,'2023-09-08',  'Under medication'),
(20	,27	, 3 ,'2023-05-06',  'Under medication'),
(14	,29	, 14 ,'2023-04-03',  'CBT therapy, no medication'),
(11	,32	, 3 ,'2023-08-03',  'Under medication'),
(4	,33	, 2 ,'2023-06-03',  'start Therapy'),
(17	,34	, 14 ,'2024-01-02',  'CBT no medication'),
(13	,37	, 3 ,'2024-05-03',  'under medication'),
(2	,41	, 18 ,'2024-07-09',  'in emergency'),
(23	,47	, 1 ,'2024-09-03',  'start medication once stable start therapy'),
(5	,52	, 1 ,'2024-03-04',  'start medication once stable start therapy'),
(6	,52	, 1 ,'2024-08-03',  'start medication once stable start therapy'),
(12	,52	, 1 ,'2024-03-09',  'start medication once stable start therapy'),
(25	,57	, 8 ,'2024-11-11',  'CBT suggested'),
(15	,59	, 14 ,'2024-01-11',  'Therapy no medication'),
(16	,62	, 3 ,'2024-03-11',  'under medication'),
(24	,62	, 1 ,'2024-03-11',  'start medication once stable start therapy');

------------------------------------------Insert values into Patient_Medication
insert into Patient_Medication(PatientID,ProviderID,MedicineID,StartDate,Quantity) values 
(18	,18	, 1 ,'2023-09-09',  30),
(8	,19	, 10,'2023-06-09',  30),
(3	,25	, 3 ,'2023-04-03', 30),
(7	,27	, 8 ,'2023-09-05',  30),
(19	,27	, 12  ,'2023-09-08',  30),
(20	,27	,  8 ,'2023-05-06',  30),
(11	,32	,  8 ,'2023-08-03',  30),
(13	,37	,  8 ,'2024-05-03',  30),
(2	,41	, 11  ,'2024-07-09', 30),
(23	,47	, 12  ,'2024-09-03',  30),
(5	,52	, 12  ,'2024-03-04',  30),
(6	,52	, 3  ,'2024-08-03',  30),
(12	,52	, 12  ,'2024-03-09',  30),
(16	,62	, 8  ,'2024-03-11',  30),
(24	,62	, 12  ,'2024-03-11',  30);

------------------------------------------Insert values into Patient_Therapy

insert into Patient_Therapy (PatientId,ProviderId,TherapyID,StartDate,LastVisitDate,Note) values
(21	,21	,  18  ,'2023-08-06', '2024-11-23' ,  'Patient active'),
(22	,21	,  16  ,'2023-05-02', '2024-11-23' ,  'Patient active'),
(1	,26	,  16 ,'2023-01-04',  '2024-11-23' , 'Patient active'),
(14	,29	,  6  ,'2023-04-03',  '2024-11-23' , 'Patient active'),
(25	,57	,  6 ,'2024-11-11',   '2024-11-23' ,'Patient active'),
(15	,59	,  21  ,'2024-01-11', '2024-11-23' ,  'Patient active'),
(23	,47	,  19  ,'2024-09-03', '2024-11-23' ,  'Patient active'),
(23	,47	,  21  ,'2024-09-03', '2024-11-23' ,  'Patient active'),
(5	,52	,  19  ,'2024-03-04', '2024-11-23' ,  'Patient active'),
(5	,52	,  21 ,'2024-03-04',  '2024-11-23' , 'Patient active'),
(6	,52	,  14 ,'2024-08-03',  '2024-11-23' , 'Patient active'),
(12	,52	,  21  ,'2024-03-09', '2024-11-23' ,  'Patient active'),
(12	,52	,  19  ,'2024-03-09', '2024-11-23' ,  'Patient active'),
(17	,34	,  17 ,'2024-01-02',  '2024-11-23' , 'Patient Active');