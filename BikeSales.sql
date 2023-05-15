Select *
From Sales

--Cleaning up incorrect fields for export

--Helmets

Select *
FRom Sales
WHERE sub_category not like 'Helmets'
and Product = 'Sport-100 Helmet, Black'

UPDATE Sales
SET Sub_Category = 'Helmets'
WHERE ID = 41961

UPDATE Sales
SET Sub_Category = 'Helmets'
WHERE ID = 41962


--Bike Racks

Select *
FRom Sales
WHERE sub_category not like 'Bike Racks'
and Product = 'Hitch Rack - 4-Bike'

UPDATE Sales
SET Sub_Category = 'Bike Racks'
WHERE ID = 1

UPDATE Sales
SET Sub_Category = 'Bike Racks'
WHERE ID = 593

UPDATE Sales
SET Sub_Category = 'Bike Racks'
WHERE ID = 594

UPDATE Sales
SET Sub_Category = 'Bike Racks'
WHERE ID = 595

UPDATE Sales
SET Sub_Category = 'Bike Racks'
WHERE ID = 596


--Bottles and Cages

Select *
FRom Sales
WHERE sub_category not like 'Bottles and Cages'
and Product = 'Water Bottle - 30 oz.'

UPDATE Sales
SET Sub_Category = 'Bottles and Cages',
	Product_Category = 'Accessories'
WHERE ID = 16925

UPDATE Sales
SET Sub_Category = 'Bottles and Cages',
	Product_Category = 'Accessories'
WHERE ID = 16926


--Cleaners

Select *
FRom Sales
WHERE sub_category not like 'Cleaners'
and Product = 'Bike Wash - Dissolver'

UPDATE Sales
SET Sub_Category = 'Cleaners'
WHERE ID = 23085

UPDATE Sales
SET Sub_Category = 'Cleaners'
WHERE ID = 23086

UPDATE Sales
SET Sub_Category = 'Cleaners'
WHERE ID = 23087

UPDATE Sales
SET Sub_Category = 'Cleaners'
WHERE ID = 23088


--Caps

Select *
FRom Sales
WHERE sub_category not like 'Caps'
and Product = 'AWC Logo Cap'

UPDATE Sales
SET Sub_Category = 'Caps'
WHERE ID = 21283

UPDATE Sales
SET Sub_Category = 'Caps'
WHERE ID = 21284

--Fenders

Select *
FRom Sales
WHERE sub_category not like 'Fenders'
and Product = 'Fender Set - Mountain'

UPDATE Sales
SET Sub_Category = 'Fenders',
	Product_Category = 'Accessories'
WHERE ID = 27117

UPDATE Sales
SET Sub_Category = 'Fenders',
	Product_Category = 'Accessories'
WHERE ID = 27118

UPDATE Sales
SET Sub_Category = 'Fenders',
	Product_Category = 'Accessories'
WHERE ID = 27119

UPDATE Sales
SET Sub_Category = 'Fenders',
	Product_Category = 'Accessories'
WHERE ID = 27120


--Bikes

Select *
FRom Sales
WHERE sub_category not like 'Touring Bikes'
and Product = 'Touring-1000 Yellow, 50'

UPDATE Sales
SET Sub_Category = 'Touring Bikes',
	Product_Category = 'Bikes'
WHERE ID = 112073

UPDATE Sales
SET Sub_Category = 'Touring Bikes',
	Product_Category = 'Bikes'
WHERE ID = 112074


--SHORTS

Select *
FRom Sales
WHERE sub_category not like 'Shorts'
and Product = "$Women$"


--Checking for blanks

Select *
From Sales
WHERE Customer_Age is Null

Select *
From Sales
WHERE Customer_Gender is Null

Select *
From Sales
WHERE Country is Null

Select *
From Sales
WHERE State is Null

Select *
From Sales
WHERE Product_Category is Null

Select *
From Sales
WHERE Sub_Category is Null

Select *
From Sales
WHERE Product is Null

Select *
From Sales
WHERE Product_Category is Null

Select *
From Sales
WHERE Order_Quantity is Null

Select *
From Sales
WHERE Unit_Cost is Null

Select *
From Sales
WHERE Unit_Price is Null

--Breaking database down by Product_category

Select *
From Sales
WHERE Product_Category = 'Accessories'

Select *
From Sales
WHERE Product_Category = 'Clothing'

Select *
From Sales
WHERE Product_Category = 'Bikes'
