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
       