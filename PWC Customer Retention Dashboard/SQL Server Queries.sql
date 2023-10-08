/*First the data was imported into sql server and then I created views for some simple data cleaning tasks,
find the sql queries below*/

--VIEW1
create view [dbo].[dimContract_PWC_CustomerRetention]
AS
SELECT
    [customerID],
	[Contract],
    [PaymentMethod],
    [PaperlessBilling],
	case
		when ([tenure]/12) >= 0 and ([tenure]/12) <= 2 then '0-2 years'
		when ([tenure]/12) >= 2 and ([tenure]/12) <= 4 then '2-4 years'
		else '4-6 years'
	end as [ContractDuration]
FROM [Forage].[dbo].[PWC_CustomerRetentionData];


--VIEW2
CREATE view [dbo].[dimCustdemographic_PWC_CustomerRetention]
AS
SELECT
    [customerID],
	[gender],
    case
		when [SeniorCitizen] = '0' then 'No'
		else 'Yes'
	end as [SeniorCitizen],
    [Partner],
    [Dependents],
	case
		when [SeniorCitizen] = '0' then 'Middle Aged'
		else 'Senior Citizen'
	end as [AgeRange]
FROM [Forage].[dbo].[PWC_CustomerRetentionData];


--VIEW3
create view [dbo].[factCustinfo_PWC_CustomerRetention]
AS
SELECT
    [customerID],
    CONVERT(INT, [tenure]) AS [Tenure],
    CONVERT(DECIMAL(10, 2), [MonthlyCharges]) AS [Monthly_charges],
    TRY_CAST([TotalCharges] AS DECIMAL(10, 2)) AS [Total_charges],
    CONVERT(INT, [numAdminTickets]) AS [Admin_tickets],
    CONVERT(INT, [numTechTickets]) AS [Tech_tickets],
    [Churn]
FROM [Forage].[dbo].[PWC_CustomerRetentionData];


--VIEW4
create view [dbo].[dimSubscription_PWC_CustomerRetention]
AS
SELECT
    [customerID],
	[PhoneService],
    [MultipleLines],
    [InternetService],
    [OnlineSecurity],
    [OnlineBackup],
    [DeviceProtection],
    [TechSupport],
    [StreamingTV],
    [StreamingMovies]
FROM [Forage].[dbo].[PWC_CustomerRetentionData];