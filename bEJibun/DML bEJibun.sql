-- Nama Kelompok
-- 2301850443	Joshia Felim Efraim
-- 2301931926	Ali Hasyim
-- 2301886916	Melissa Lionardy Liong
-- 2301904061	Muhammad Ridwan Kamil




-- DML insert data

INSERT INTO MsCustomer(ID_Customer, Nama, Gender, Phone, DateOfBirth) VALUES
('CU123', 'Jessica', 'Female' , '082190929934','1991-01-10'),
('CU456', 'Matthew', 'Male', '081324136745', '2000-08-14'),
('CU789', 'Leonel', 'Male', '085212344567', '1995-08-08'),
('CU124', 'Bella' , 'Female', '081356313332)', '1998-02-19'),
('CU125', 'Jenifer', 'Female', '085211198870)', '1991-06-24'),
('CU465', 'Benedictus', 'Male', '082145452313', '1992-01-11'),
('CU914', 'Kevin', 'Male', '082134341212', '1993-03-15'),
('CU324', 'Michelle', 'Female', '081320908981', '1994-02-16'),
('CU156', 'Rafa', 'Male', '082190432312', '1995-10-22'),
('CU178', 'Michael', 'Male', '081324121989', '1998-11-10')


INSERT INTO MsStaff(ID_Staff, Nama_Staff, Gender_Staff, Phone_Staff, Salary_Staff) VALUES
('ST723', 'Arsy', 'Male', '085256431212', 2000000),
('ST212', 'Bianca', 'Female', '081356805555', 2500000),
('ST132', 'Ghea', 'Female', '085212909877', 3000000),
('ST987', 'Rano', 'Male', '082214324567', 2800000),
('ST634', 'Melaney', 'Female', '082190902121', 2400000),
('ST352', 'Ricky', 'Male', '082123432343' ,2200000),
('ST812', 'Roni', 'Male', '082123988967' ,2400000),
('ST912', 'Randy' , 'Male' , '085266445588', 2500000),
('ST162', 'Michael', 'Male' , '085232239878', 1800000),
('ST292', 'Dicky', 'Male', '081361617171', 2100000)

INSERT INTO MsType_Item(ID_Type, TypeName) VALUES
('IP912', 'Food'),
('IP235', 'Drink'),
('IP982', 'Elektronik'),
('IP182', 'Gadgets'),
('IP263', 'Vegetable'),
('IP372', 'Fruit'),
('IP582', 'Chicken'),
('IP925', 'Fish'),
('IP413', 'Snack'),
('IP342', 'Candies')

INSERT INTO MsItem(ID_Item, ID_Type_Item, Item_Name, Price, Min_Purchase) VALUES
('IT357', 'IP912', 'Ikan Kaleng', 15000, 30),
('IT232', 'IP235', 'Aqua', 5000, 50),
('IT756', 'IP912', 'Kornet', 25000, 30 ),
('IT942', 'IP982', 'Mixer',  250000, 20),
('IT512', 'IP342', 'Kopiko', 4500, 100),
('IT435', 'IP235', 'Cola - Cola', 12000, 70),
('IT612', 'IP982', 'Televisi', 3000000, 10),
('IT434', 'IP413', 'Pilus Garuda', 5500, 50),
('IT622', 'IP182', 'Samsung S9', 4500000, 10),
('IT222', 'IP182', 'Iphone 7', 3500000,10)


INSERT INTO TrSales_Transaction(ID_SalesTransaction, IDCustomer, IDStaff, Sales_Date) VALUES
('SA645', 'CU456', 'ST987', '2020-10-10'),
('SA215', 'CU465', 'ST987', '2020-02-19'),
('SA535', 'CU156', 'ST212', '2020-03-25'),
('SA853', 'CU789', 'ST212', '2020-06-06'),
('SA225', 'CU125', 'ST132', '2020-07-14'),
('SA111', 'CU456', 'ST987', '2020-05-23'),
('SA644', 'CU124', 'ST132', '2020-11-24'),
('SA542', 'CU465', 'ST812', '2020-02-21'), 
('SA351', 'CU124', 'ST132', '2020-06-06'),
('SA802', 'CU789', 'ST987', '2020-07-24'),
('SA372', 'CU124', 'ST132', '2020-04-27'),
('SA634', 'CU123', 'ST212', '2020-07-14'),
('SA453', 'CU789', 'ST723', '2020-10-10'),
('SA342', 'CU178', 'ST812', '2020-03-25'),
('SA231', 'CU789', 'ST987', '2020-12-01')

INSERT INTO DetailSalesTransaction(ID_Sales_Transaction, IDItem, Quantity) VALUES
('SA645', 'IT756', 5),
('SA645', 'IT622', 1),
('SA225', 'IT232', 15),
('SA215', 'IT357', 5),
('SA231', 'IT222', 1),
('SA111', 'IT434', 5),
('SA111', 'IT612', 4),
('SA372', 'IT357', 10),
('SA372', 'IT612', 2),
('SA802', 'IT622', 2),
('SA634', 'IT222', 2),
('SA634', 'IT435', 20),
('SA644', 'IT434', 3),
('SA351', 'IT357', 5),
('SA351', 'IT942', 3),
('SA351', 'IT612', 2),
('SA535', 'IT232', 4),
('SA535', 'IT357', 25),
('SA372', 'IT222', 1),
('SA372', 'IT434', 3),
('SA853', 'IT435', 2),
('SA342', 'IT756', 3),
('SA342', 'IT357', 2),
('SA225', 'IT612', 4),
('SA542', 'IT434', 2)

INSERT INTO MsVendor(ID_Vendor, Nama, Phone, Address_Vendor, Email) VALUES
('VE323', 'Mega', '082123320100', 'Sakura Street', 'megalimanu@gmail.com'),
('VE371', 'Rangga', '082273219998', 'Lili Street', 'ranggaaz@gmail.com'),
('VE342', 'Devi', '082234229912', 'Teratai Street', 'devimelan@yahoo.com'),
('VE241', 'Dimas', '082178222090', 'Food street', 'dimassepti@yahoo.com'),
('VE632', 'Elang', '082124419066', 'Mawar Street','elangas@gmail.com'),
('VE459', 'Ariel', '081324096856', 'Delima Street', 'arielpri@gmail.com'),
('VE878', 'Abas', '082211086556', 'Food Street', 'abasdelano@gmail.com'),
('VE757', 'Tasya', '085209124732', 'Food Street', 'tasyamanus@yahoo.com'),
('VE456', 'Amanda', '082240912431', 'Melati Street', 'amandaman@gmail.com'),
('VE767', 'Rizky', '081329479383', 'Mawar Street', 'rizkybilard@gmail.com')

INSERT INTO TrPurchase_Transaction(ID_Purchase_Transaction, ID__Staff, IDVendor, Purchase_Date, Arrival_Date) VALUES
('PH646', 'ST634', 'VE342', '2020-10-01', '2020-10-15'),
('PH124', 'ST352', 'VE342', '2020-12-05',NULL),
('PH227', 'ST162', 'VE342', '2020-09-05', '2020-09-30'),
('PH772', 'ST132', 'VE878', '2020-11-02', '2020-11-25'),
('PH991', 'ST812', 'VE767', '2020-12-10',NULL),
('PH889', 'ST634', 'VE342', '2020-10-17', '2020-10-30'),
('PH777', 'ST212', 'VE323', '2020-12-01',NULL),
('PH666', 'ST132', 'VE323', '2020-06-12', '2020-07-30'),
('PH112', 'ST132', 'VE459', '2020-11-30',NULL),
('PH431', 'ST352', 'VE757', '2020-12-12',NULL),
('PH854', 'ST352', 'VE371', '2020-05-07', '2020-05-21'),
('PH634', 'ST352', 'VE371', '2020-10-12',NULL),
('PH834', 'ST132', 'VE323', '2020-10-07','2020-10-30'),
('PH119', 'ST132', 'VE757', '2020-11-01', '2020-12-10'),
('PH234', 'ST634', 'VE459', '2020-11-28',NULL)


INSERT INTO DetailPurchaseTransaction(ID_PurchaseTransaction, ID_ItemPT, Quantity) VALUES
('PH646', 'IT756', 10),
('PH646', 'IT612', 5),
('PH646', 'IT942', 5),
('PH124', 'IT222', 5),
('PH772', 'IT512', 10),
('PH772', 'IT434', 10),
('PH227', 'IT232', 5),
('PH991', 'IT622', 5),
('PH991', 'IT435',15),
('PH889', 'IT942', 5),
('PH777', 'IT512', 5),
('PH777', 'IT434', 5),
('PH666', 'IT622', 10),
('PH112', 'IT222', 2),
('PH112', 'IT756',5),
('PH431', 'IT942', 3),
('PH431', 'IT622', 2),
('PH431', 'IT222', 1),
('PH854', 'IT435', 10),
('PH634', 'IT434', 5),
('PH634', 'IT942', 2),
('PH634', 'IT756', 5),
('PH119', 'IT434', 2),
('PH119', 'IT232', 5),
('PH234', 'IT612', 5)



