-- Nama Kelompok
-- 2301850443	Joshia Felim Efraim
-- 2301931926	Ali Hasyim
-- 2301886916	Melissa Lionardy Liong
-- 2301904061	Muhammad Ridwan Kamil



-- 1
SELECT 
	[Item Name] = Item_Name,
	[Item Price] = Price,
	[Item Total] = SUM(Quantity)
FROM MsItem, DetailPurchaseTransaction, TrPurchase_Transaction
WHERE Quantity>100 AND TrPurchase_Transaction.ID_Purchase_Transaction = DetailPurchaseTransaction.ID_PurchaseTransaction AND TrPurchase_Transaction.Arrival_Date = NULL 
GROUP BY Item_Name, Price, Quantity
ORDER BY Quantity DESC

-- 2  
SELECT 
	[Vendor Name] = Nama,
	[Domain Name] = SUBSTRING(Email,CHARINDEX('@',Email)+1,LEN(Email)),
	[Average Purchased Item] = AVG(Quantity)
FROM MsVendor, DetailPurchaseTransaction, TrPurchase_Transaction
WHERE (MsVendor.Address_Vendor LIKE 'Food Street') AND (MsVendor.Email NOT LIKE '%gmail.com') AND TrPurchase_Transaction.IDVendor = MsVendor.ID_Vendor AND DetailPurchaseTransaction.ID_PurchaseTransaction = TrPurchase_Transaction.ID_Purchase_Transaction
GROUP BY Nama,Email,Quantity

-- 3 
SELECT 
	[Month] = MONTH(Sales_Date),
	[Minimum Quantity Sold] = MIN(Quantity), 
	[Maximum Quantity Sold] = MAX(Quantity)
FROM TrSales_Transaction,DetailSalesTransaction, MsType_Item, MsItem
WHERE YEAR(Sales_Date)=2019 AND  TrSales_Transaction.ID_SalesTransaction = DetailSalesTransaction.ID_Sales_Transaction AND DetailSalesTransaction.IDItem = MsItem.ID_Item AND MsItem.ID_Type_Item = MsType_Item.ID_Type AND (MsType_Item.TypeName NOT LIKE 'Food' OR MsType_Item.TypeName NOT LIKE 'Drink')
GROUP BY Sales_Date,Quantity

-- 4
SELECT 
	[Staff Number] = REPLACE(TrSales_Transaction.IDStaff,'ST','Staff'), 
	[Staff Name] = MsStaff.Nama_Staff, 
	[Salary] = 'Rp. ' + CAST(MsStaff.Salary_Staff AS VARCHAR),
	[Sales Count] = SUM(DetailSalesTransaction.Quantity * MsItem.Price),
	[Average Sales Quantity] = AVG(DetailSalesTransaction.Quantity)
FROM MsStaff, TrSales_Transaction, DetailSalesTransaction, MsItem
WHERE MsStaff.ID_Staff = TrSales_Transaction.IDStaff AND TrSales_Transaction.ID_SalesTransaction = DetailSalesTransaction.ID_Sales_Transaction AND DetailSalesTransaction.IDItem = MsItem.ID_Item AND MONTH(TrSales_Transaction.Sales_Date) = 02
GROUP BY TrSales_Transaction.IDStaff, MsStaff.Salary_Staff, MsStaff.Nama_Staff

--5
SELECT
	[Customer Initial] = LEFT(MsCustomer.Nama, 1) + RIGHT(MsCustomer.Nama, 1),
	[Transaction Date] = CONVERT(VARCHAR, Sales_Date, 107),
	 [Quantity] = SUM(Quantity)
FROM MsCustomer, TrSales_Transaction, DetailSalesTransaction
WHERE MsCustomer.ID_Customer = TrSales_Transaction.IDCustomer AND DetailSalesTransaction.ID_Sales_Transaction = TrSales_Transaction.ID_SalesTransaction AND  MsCustomer.Gender LIKE 'Female' AND Quantity > ( SELECT AVG(Quantity) FROM DetailSalesTransaction )
GROUP BY MsCustomer.Nama, TrSales_Transaction.Sales_Date

 --6
SELECT
	[ID] = LOWER(MsVendor.ID_Vendor),
	[VendorName] = MsVendor.Nama,
	[Vendor's Phone] = '+62' + SUBSTRING(Phone, 2, len(Phone)),
	[Item ID] = ID_ItemPT
FROM MsVendor, TrPurchase_Transaction, DetailPurchaseTransaction
WHERE
 MsVendor.ID_Vendor = TrPurchase_Transaction.IDVendor AND
 TrPurchase_Transaction.ID_Purchase_Transaction = DetailPurchaseTransaction.ID_PurchaseTransaction AND
 Quantity > (SELECT MIN(Quantity) FROM DetailPurchaseTransaction) AND
 RIGHT(ID_ItemPT, 1) % 2 != 0

--7
SELECT
 [StaffName] = MsStaff.Nama_Staff,
 [VendorName] = MsVendor.Nama,
 [PurchaseID] = ID_Purchase_Transaction,
 [Total Purchased Quantity] = SUM(DetailPurchaseTransaction.Quantity),
 [Ordered Day] = (CAST(DATEDIFF(day, Purchase_Date,CAST (GETDATE() AS DATE)) AS VARCHAR)) + ' Days Ago'
FROM MsStaff, MsVendor, TrPurchase_Transaction, DetailPurchaseTransaction
WHERE
 MsStaff.ID_Staff = TrPurchase_Transaction.ID__Staff AND
 TrPurchase_Transaction.IDVendor = MsVendor.ID_Vendor AND
 TrPurchase_Transaction.ID_Purchase_Transaction = DetailPurchaseTransaction.ID_PurchaseTransaction AND
 DATEDIFF(day, Arrival_Date, Purchase_Date) < 7
GROUP BY MsVendor.Nama, ID_Purchase_Transaction, Nama_Staff, Purchase_Date
HAVING SUM(DetailPurchaseTransaction.Quantity) >  (SELECT MAX( Quantity) FROM DetailPurchaseTransaction)

--8
SELECT  TOP 2 DAY(Sales_Date) AS 'Day',COUNT(ID_SalesTransaction) AS 'Item Sales Amount' 
FROM TrSales_Transaction, DetailSalesTransaction,MsItem, MsType_Item
WHERE TrSales_Transaction.ID_SalesTransaction = DetailSalesTransaction.ID_Sales_Transaction AND DetailSalesTransaction.IDItem = MsItem.ID_Item AND Price < ( SELECT AVG(Price) FROM MsItem) AND (TypeName LIKE 'Electronic' AND TypeName LIKE 'Gadgets') 
GROUP BY TrSales_Transaction.Sales_Date, TrSales_Transaction.ID_SalesTransaction
ORDER BY ID_SalesTransaction DESC



--9
CREATE VIEW [Customer Statistic By Gender] AS
SELECT 
	[CustomerGender] = Gender,
	[Maximum Sales] = MAX(Quantity),
	[Minimum Sales] = MIN(Quantity)
FROM MsCustomer, DetailSalesTransaction
WHERE Quantity >= 20 AND Quantity <= 50 AND YEAR(DateOfBirth) >= 1998 AND YEAR(DateOfBirth) <= 1999
GROUP BY Gender,Quantity,Quantity

--10
CREATE VIEW [Item Type Statistic] AS
SELECT 
	[Item Type] = UPPER(TypeName),
	[Average Price] = AVG(Price), 
	[Number Of Item Variety] = Count(Quantity)
FROM  MsType_Item,DetailSalesTransaction, MsItem
WHERE MsType_Item.TypeName LIKE 'F%' AND MsItem.Min_Purchase > 5
GROUP BY TypeName,Price,Quantity