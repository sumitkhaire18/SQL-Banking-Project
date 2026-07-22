show databases;
create database BankingDB; 
use BankingDB;
create table Customers(
   customerid int primary key,
   firstname varchar(50),
   lastname varchar(50),
   email varchar(100),
   phone varchar(15),
   accountcreation_date date
   );
   Drop table Customers;
  Create Table Accounts (
	AccountId INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
    );

Create Table Transactions (
   TransactionId INT,
   TransactionDate Date,
   Amount DECIMAL(10,2),
   TransactionType VARCHAR(20)
   );
   Create Table Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAdress VARCHAR(200),
    BranchPhone VARCHAR(15));
    Create Table AccountBranches (
      AssignmentDate Date);
      Create Table Loans (
       LoanID INT,
       LoanAmount DECIMAL(10,2),
       InterestRate DECIMAL(5,2),
       StartDate Date,
       EndDate date
       );
       
       ALTER TABLE Customers
       ADD DateOfBirth DATE;
       select * from Customers;
       ALTER TABLE Customers
       MODIFY Phone VARCHAR(50);
       Alter Table Customers Drop DateOfBirth;
       ALTER TABLE Accounts
       ADD CONSTRAINT chk_MinBalance
       CHECK (Balance >= 1000);
       Alter Table Accounts Add Primary key (AccountID);
       Create Table DR332(
        Learnerid int primary key,
        first_name varchar(50) not null,
        last_name varchar (50) unique,
        progress decimal(5,2) check(progress>75),
        branch varchar(50) default "Dadar"
        );
                ALTER TABLE Branches ADD PRIMARY KEY (BranchID);
       ALTER TABLE Branches ADD Courses VARCHAR(50);
       ALTER TABLE Branches Rename Column Courses to COURSES;
       select * from Branches;
       
       ALTER TABLE Accounts ADD CustomerID INT;
       ALTER TABLE Accounts
       ADD CONSTRAINT FK_Accounts_Customers
       FOREIGN KEY (CustomerID)
       REFERENCES Customers (CustomerID);
       select * from Customers;
       
       insert into Customers(CustomerID,Firstname,Lastname,Email,Phone,AccountCreation_Date)
       Values(001, "Sumit", "Khaire", "sumitkhaire228@gmail.com", 9870557501, '2026-07-17');
       insert into Customers (customerid, firstname, lastname, email, phone, accountcreation_date)
       Values (002, "Pravin", "boddupally", "pravin123@gmail.com", 9876543210, "2026-07-20"),
       (003, "Daya", "Mestry", "daya123@gmail.com",1234567894, "2026-07-18");
       insert into customers(customerid,firstname,lastname,phone,accountcreation_date) values
       (004,"Rushi", "Injale", 23456789743, "2026-07-16");
       insert into Customers(customerid, firstname, email, phone, accountcreation_date) values
       (005, "Tejal", "Tejal324@gmail.com", 23456789877, "2026-07-17")
       update Customers set phone= 9876944948 where firstname= "Tejal";
       update Customers set email= "dayamestry32@gmail.com" where customerid= 003;
       set sql_safe_updates=0;
       delete from customers where firstname = "Rushi";
       rollback;
       select * from Customers;
       truncate table Customers;
       start transaction;
       delete from Customers where firstname = "Rushi";
       rollback;
       select * from customers;
       #DQL
       select * from Customers;
       select * from Customers where lastname= "Mestry";
       select email, phone from customers where firstname= "Daya";
       #APPROXIMATE MATCH
       select * from Customers Where firstname like "%a"; #endswith
       select * from Customers where firstname like "R%"; #startswith
       select * from Customers where firstname like "%T%";
       select * from Customers order by firstname;
       select * from Customers order by firstname desc;
       select * from Customers order by accountcreation_date desc;
       select * from Customers order by accountcreation_date desc limit 1; #
       select * from Customers order by accountcreation_date asc limit 1;
       select * from Customers order by accountcreation_date desc limit 1 offset 1;
       
       insert into accounts(AccountID, AccountType, Balance, CustomerID) 
       values (101, "Savings", 10000, 1);
       select * from Accounts;
       insert into accounts(AccountID, AccountType, Balance, CustomerID)
       values (102,"Current", 15000, 2),
       (103, "Savings", 20000, 3), (104,"Salary", 25000,4),
       (105,"Savings",70000,5);
       insert into accounts(AccountID, AccountType, Balance, CustomerID)
       values(107, "Salary",80000, 7);
       select * from Accounts;
       select * from Accounts order by Balance;
       select * from Accounts order by Balance limit 2;
       select * from Accounts where Balance > 15000;
       select * from Accounts where Balance > 15000 and AccountType="Savings";
       select * from Accounts where Balance > 15000 or AccountType= "Salary";
	select * from Accounts where Balance between 5000 and 16000;
    show tables;
    desc customers;
    desc accounts;
    desc branches;
    insert into branches(BranchID, Branchname, BranchAdress, BranchPhone, Courses)
    values (1001, "Dadar", "Mumbai", 9876433224, "DSA"), (1002, "Thane", "Thane-West", 2345678987, "CyberSecurity"),
    (1003,"Vashi" , "Navi Mumbai", 4567894539, "Devops");
    
    #Agggreegate Function
    select * from accounts;
    #to find unique accounttype
    select distinct(AccountType) from accounts;
    #group by
    select min(balance),AccountType from accounts group by AccountType;
    select max(balance),AccountType from accounts group by AccountType;
    select sum(balance),AccountType from accounts group by AccountType;
    select avg(balance),AccountType from accounts group by AccountType;
    select count(balance), AccountType from accounts group by AccountType;
    select min(balance) as minimum_amount, max(balance), sum(balance),count(balance), avg(balance), AccountType from accounts group by AccountType;
   select * from branches;
   insert into branches(BranchID, Branchname, BranchAdress, BranchPhone, Courses)
   values(1004, "Sion", "Mumbai", 6754328765, "AI & ML"), (1005, "Matunga", "Mumbai", 9876435675, "DSA");
   
   #NULL Handing
   select * from customers;
   select * from customers where email IS NULL;
   select * from customers where lastname IS NULL;
   select * from customers where email is not null;
   select * from customers where email & lastname is not null;
   insert into loans (LoanID, LoanAmount, InterestRate, StartDate, EndDate)
   values (21, 4000000, 5.6, "2026-07-23", "2028-07-20");
   insert into loans (LoanID, LoanAmount, InterestRate, StartDate, EndDate)
   values (22, 4500000, 8.8, "2024-08-20", "2029-07-23"),( 23, 5000000, 12.5, "2023-06-03","2028-07-20"),
   (24, 6000000, 17.6, "2024-09-13", "2027-07-20"),
   (25, 5500000, 15.5, "2025-10-12", "2029-12-13");
   select * from loans;
   select * from loans where StartDate>"2024-10-12";
   select max(InterestRate) from loans;
   select InterestRate from loans order by InterestRate desc limit 1;
   
   #Cases
   select LoanID, LoanAmount,
   case when LoanAmount>58000000 then "Premium Loan"
        when LoanAmount>54000000 then "Standard Loan"
        else "Basic loan"
        end
        as loan_type from loans;
        
   select AccountId, Balance,
   case when Balance>25000 then "Premium Account"
        when Balance>15000 then "Standard Account"
        else "Basic Account"
        end as new_column from accounts;
 use bankingdb;       
select * from customers;

#windows functions 1 rank without partition 
select AccountId, Balance, rank() over (order by Balance desc) from accounts;
select AccountId, Balance, dense_rank() over (order by balance desc) from accounts;
update Accounts set  Balance= 70000 where AccountID=104;

# 2rank with partition
select AccountID, Balance, AccountType, rank() over (partition by AccountType order by Balance desc) typewise_ranking from accounts;
select AccountID, Balance, AccountType, dense_rank() over (partition by AccountType order by Balance desc) typewise_ranking from accounts;
select AccountID, Balance, AccountType, percent_rank() over (partition by AccountType order by Balance desc) typewise_ranking from accounts;

# lead and lag without partition
select AccountId, Balance, lead(Balance) over (order by  Balance Desc) as lead_balance from accounts;
select AccountId, Balance, lag(Balance) over (order by  Balance Desc) as lead_balance from accounts;

select AccountID, AccountType, Balance from accounts where AccountType= "Savings" or 
AccountType= "Current";
select * from Accounts;
select AccountID, AccountType, Balance from accounts where AccountType 
in ("Savings", "Current");




select LoanID, LoanAmount, rank() over (order by LoanAmount desc) from Loans;
select LoanID, LoanAmount, dense_rank() over (order by LoanAmount desc) from Loans;
#with partition Loans table Windows function
select LoanId, LoanAmount, InterestRate, rank() over (order by LoanAmount desc)
as type_wise_ranking from Loans;
select LoanId, LoanAmount, InterestRate, dense_rank() over (order by LoanAmount desc)
as type_wise_ranking from Loans;
select LoanId, LoanAmount, InterestRate, percent_rank() over (order by LoanAmount desc)
as type_wise_ranking from Loans;
select LoanID, LoanAmount, lead(LoanAmount) over (order by LoanAmount desc) as lead_LoanAmount from Loans;
select LoanID, LoanAmount, lag(LoanAmount) over (order by LoanAmount desc) as lead_LoanAmount from Loans;

#having Clause
select min(Balance), AccountType from accounts group by AccountType;
select min(Balance), AccountType from accounts group by AccountType order by min(Balance);

select min(Balance), AccountType from Accounts group by AccountType
having (min(Balance)>9000) order by min(Balance);
select AccountType from accounts group by AccountType;
select distinct AccountType from accounts;

select now();
select current_date();
select sysdate();

select * from Transactions;
insert into Transactions( TransactionID, TransactionDate, Amount, TransactionType)
values( 1, "2024-08-03",1000000.20,"Cash");
insert into Transactions( TransactionID, TransactionDate, Amount, TransactionType)
values( 2, "2024-12-18",13000000.32,"UPI"), (3, "2022-05-02",2500000.56, "Card"),
(4 , "2023-01-13",2660000.67, "Cash"), (5, "2022-04-17", 50000000.82, "Card"),
(6, "2020-03-12", 7800000, "UPI");
