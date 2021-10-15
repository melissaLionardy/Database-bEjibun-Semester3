-- Nama Kelompok
-- 2301850443	Joshia Felim Efraim
-- 2301931926	Ali Hasyim
-- 2301886916	Melissa Lionardy Liong
-- 2301904061	Muhammad Ridwan Kamil




CREATE DATABASE bEJibun 
GO
USE bEJibun

CREATE TABLE MsCustomer(
	ID_Customer VARCHAR(5) PRIMARY KEY,
	Nama VARCHAR(255),
	Gender VARCHAR(255),
	Phone VARCHAR(255),
	DateOfBirth DATE,
	
	CONSTRAINT ID_Customer CHECK(ID_Customer LIKE 'CU[0-9][0-9][0-9]'),
	CONSTRAINT Gender CHECK(Gender LIKE 'Female' OR Gender LIKE 'Male'),
)



CREATE TABLE MsStaff(
	ID_Staff VARCHAR(5) PRIMARY KEY,
	Nama_Staff VARCHAR(255),
	Gender_Staff VARCHAR(255),
	Phone_Staff VARCHAR(255),
	Salary_Staff NUMERIC(19,0) CHECK (Salary_Staff > 0), 

	CONSTRAINT ID_Staff CHECK(ID_Staff LIKE 'ST[0-9][0-9][0-9]'),
	CONSTRAINT Gender_Staff CHECK(Gender_Staff LIKE 'Female' OR Gender_Staff LIKE 'Male')
)

CREATE TABLE MsType_Item(
	ID_Type VARCHAR(5) PRIMARY KEY,
	TypeName VARCHAR(255),

	CONSTRAINT ID_Type CHECK(ID_Type LIKE 'IP[0-9][0-9][0-9]'),
	CONSTRAINT TypeName CHECK ( (LEN(LTRIM(RTRIM(TypeName))) >= (4)) )
)

CREATE TABLE MsItem(
	ID_Item VARCHAR(5) PRIMARY KEY,
	ID_Type_Item VARCHAR(5),
	Item_Name VARCHAR(255),
	Price NUMERIC(19,0) CHECK (Price > 0),
	Min_purchase INT, 


	CONSTRAINT ID_Item CHECK(ID_Item LIKE 'IT[0-9][0-9][0-9]'),
	CONSTRAINT ID_Type_Item CHECK(ID_Type_Item LIKE 'IP[0-9][0-9][0-9]'), 
	FOREIGN KEY(ID_Type_Item) REFERENCES MsType_Item(ID_Type)
)


CREATE TABLE TrSales_Transaction(
	ID_SalesTransaction VARCHAR(5),
	IDCustomer VARCHAR(5),
	IDStaff VARCHAR(5),
	Sales_Date DATE,
	
	CONSTRAINT ID_SalesTransaction CHECK(ID_SalesTransaction LIKE 'SA[0-9][0-9][0-9]'),
	CONSTRAINT IDCustomer CHECK(IDCustomer LIKE 'CU[0-9][0-9][0-9]'),
	CONSTRAINT IDStaff CHECK(IDStaff LIKE 'ST[0-9][0-9][0-9]'),

	PRIMARY KEY(ID_SalesTransaction),
	FOREIGN KEY(IDCustomer) REFERENCES MsCustomer(ID_Customer),
	FOREIGN KEY(IDStaff) REFERENCES MsStaff(ID_Staff)
)

CREATE TABLE DetailSalesTransaction(
	ID_Sales_Transaction VARCHAR(5),
	IDItem VARCHAR(5),
	Quantity INT,

	CONSTRAINT ID_Sales_Transaction CHECK(ID_Sales_Transaction LIKE 'SA[0-9][0-9][0-9]'),
	CONSTRAINT IDItem CHECK(IDItem LIKE 'IT[0-9][0-9][0-9]'),
	
	PRIMARY KEY(ID_Sales_Transaction, IDItem),
	FOREIGN KEY(ID_Sales_Transaction) REFERENCES TrSales_Transaction(ID_SalesTransaction),
	FOREIGN KEY(IDItem) REFERENCES MsItem(ID_Item)
)

CREATE TABLE MsVendor(
	ID_Vendor VARCHAR(5) PRIMARY KEY,
	Nama VARCHAR(255),
	Phone VARCHAR(255),
	Address_Vendor VARCHAR(255),
	Email VARCHAR(255),
	
	CONSTRAINT ID_Vendor CHECK(ID_Vendor LIKE 'VE[0-9][0-9][0-9]'),
	CONSTRAINT Address_Vendor CHECK(Address_Vendor LIKE '% Street'),
	CONSTRAINT Email CHECK(Email LIKE '%@%.com')
)

CREATE TABLE TrPurchase_Transaction(
	ID_Purchase_Transaction VARCHAR(5),
	ID__Staff VARCHAR(5),
	IDVendor VARCHAR(5),
	Purchase_Date DATE,
	Arrival_Date DATE,


	CONSTRAINT ID_Purchase_Transaction CHECK(ID_Purchase_Transaction LIKE 'PH[0-9][0-9][0-9]'),
	CONSTRAINT ID__Staff CHECK(ID__Staff LIKE 'ST[0-9][0-9][0-9]'), 
	CONSTRAINT IDVendor CHECK(IDVendor LIKE 'VE[0-9][0-9][0-9]'),

	PRIMARY KEY(ID_Purchase_Transaction),
	FOREIGN KEY(ID__Staff) REFERENCES MsStaff(ID_Staff),
	FOREIGN KEY(IDVendor) REFERENCES MsVendor(ID_Vendor)

)

CREATE TABLE DetailPurchaseTransaction(
	ID_PurchaseTransaction VARCHAR(5),
	ID_ItemPT VARCHAR(5),
	Quantity INT,

	CONSTRAINT ID_PurchaseTransaction CHECK(ID_PurchaseTransaction LIKE 'PH[0-9][0-9][0-9]'),
	CONSTRAINT ID_ItemPT CHECK(ID_ItemPT LIKE 'IT[0-9][0-9][0-9]'),

	PRIMARY KEY(ID_PurchaseTransaction, ID_ItemPT),
	FOREIGN KEY(ID_PurchaseTransaction) REFERENCES TrPurchase_Transaction(ID_Purchase_Transaction),
	FOREIGN KEY(ID_ItemPT) REFERENCES MsItem(ID_Item)
)

