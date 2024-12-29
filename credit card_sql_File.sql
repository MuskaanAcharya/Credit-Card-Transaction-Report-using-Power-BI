-- Create a database 
create database creditcard;

use creditcard;

--Create cc_detail table

CREATE TABLE cc_detail (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);

--Create cc_detail table
CREATE TABLE cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);

--  Copy csv data into SQL of cc_detail table
select * from cc_detail
BULK INSERT cc_detail
FROM 'D:\credit_card.csv'
WITH (
    FIELDTERMINATOR = ',', -- Specifies that the fields are separated by commas
    ROWTERMINATOR = '\n',  -- Specifies that rows end with a new line
    FIRSTROW = 2,          -- Skips the header row
    TABLOCK                -- Optimizes performance
);

--  Copy csv data into SQL of cust_detail
select * from cust_detail
BULK INSERT cust_detail
FROM 'D:\customer.csv'
WITH (
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n',  
    FIRSTROW = 2,          
    TABLOCK                
);

-- Set the date format to Day-Month-Year
SET DATEFORMAT DMY; 

--Insert additional data into SQL, using same COPY function
-- copy additional data (week-53) in cc_detail table
BULK INSERT cc_detail
FROM 'D:\cc_add.csv'
WITH (
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n',  
    FIRSTROW = 2           
);
-- copy additional data (week-53) in cust_detail table 
BULK INSERT cust_detail
FROM 'D:\cust_add.csv'
WITH (
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n',  
    FIRSTROW = 2           
);



