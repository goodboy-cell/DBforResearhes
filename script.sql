USE [Employee management]
GO
/****** Object:  Table [dbo].[TbCustomers]    Script Date: 09/06/2020 05:05:49 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbCustomers](
	[CustomerID] [int] NOT NULL,
	[customerName] [nvarchar](100) NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[customerAddress] [varchar](50) NOT NULL,
	[postalCode] [varchar](10) NOT NULL,
	[SalesReNo] [int] NOT NULL,
	[Country] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TbCustomers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbEmployees]    Script Date: 09/06/2020 05:05:49 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbEmployees](
	[EmployeeID] [int] NOT NULL,
	[EmployeeName] [varchar](100) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[JobTitle] [varchar](50) NOT NULL,
	[OfficeCode] [int] NOT NULL,
 CONSTRAINT [PK_Table_2] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbOrderDetails]    Script Date: 09/06/2020 05:05:49 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbOrderDetails](
	[OrderID] [int] NOT NULL,
	[ProductCode] [varchar](15) NOT NULL,
	[Qantity] [int] NOT NULL,
	[uniquePRICE] [decimal](10, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbOrders]    Script Date: 09/06/2020 05:05:49 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbOrders](
	[OrderID] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[DateRequested] [date] NOT NULL,
	[comments] [text] NOT NULL,
	[CustomerID] [int] NOT NULL,
 CONSTRAINT [PK_TbOrders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbPayments]    Script Date: 09/06/2020 05:05:49 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbPayments](
	[CustomerID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[paymentdate] [date] NOT NULL,
	[paymentamount] [decimal](10, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbProducts]    Script Date: 09/06/2020 05:05:49 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbProducts](
	[ProductCode] [varchar](15) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[ProductDescription] [text] NOT NULL,
	[QuantityStock] [int] NULL,
 CONSTRAINT [PK_TbProducts] PRIMARY KEY CLUSTERED 
(
	[ProductCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TbEmployees]  WITH CHECK ADD  CONSTRAINT [FK_TbEmployees_TbCustomers] FOREIGN KEY([OfficeCode])
REFERENCES [dbo].[TbCustomers] ([CustomerID])
GO
ALTER TABLE [dbo].[TbEmployees] CHECK CONSTRAINT [FK_TbEmployees_TbCustomers]
GO
ALTER TABLE [dbo].[TbEmployees]  WITH CHECK ADD  CONSTRAINT [FK_TbEmployees_TbEmployees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[TbEmployees] ([EmployeeID])
GO
ALTER TABLE [dbo].[TbEmployees] CHECK CONSTRAINT [FK_TbEmployees_TbEmployees]
GO
ALTER TABLE [dbo].[TbOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_TbOrderDetails_TbOrders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[TbOrders] ([OrderID])
GO
ALTER TABLE [dbo].[TbOrderDetails] CHECK CONSTRAINT [FK_TbOrderDetails_TbOrders]
GO
ALTER TABLE [dbo].[TbOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_TbOrderDetails_TbProducts] FOREIGN KEY([ProductCode])
REFERENCES [dbo].[TbProducts] ([ProductCode])
GO
ALTER TABLE [dbo].[TbOrderDetails] CHECK CONSTRAINT [FK_TbOrderDetails_TbProducts]
GO
ALTER TABLE [dbo].[TbOrders]  WITH CHECK ADD  CONSTRAINT [FK_TbOrders_TbCustomers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[TbCustomers] ([CustomerID])
GO
ALTER TABLE [dbo].[TbOrders] CHECK CONSTRAINT [FK_TbOrders_TbCustomers]
GO
ALTER TABLE [dbo].[TbPayments]  WITH CHECK ADD  CONSTRAINT [FK_TbPayments_TbCustomers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[TbCustomers] ([CustomerID])
GO
ALTER TABLE [dbo].[TbPayments] CHECK CONSTRAINT [FK_TbPayments_TbCustomers]
GO
ALTER TABLE [dbo].[TbPayments]  WITH CHECK ADD  CONSTRAINT [FK_TbPayments_TbOrders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[TbOrders] ([OrderID])
GO
ALTER TABLE [dbo].[TbPayments] CHECK CONSTRAINT [FK_TbPayments_TbOrders]
GO
SELECT productName FROM TbProduct
     WHERE ID IN (SELECT OrderID
	FROM TbOrderDetails
	WHERE Quantity >100)
SELECT CustomerName
      OrderCount = (select count (0.ID) FROM [TbOrders] 0 WHERE 0. CustomerID = c.ID) 
       FROM TbCustomer.
SELECT paymentamount 
     WHERE DATE IN (SELECT paymentdate
      FROM TbPayments WHERE amount >1000)
SELECT COUNT (CustomerID)
     FROM [TbCustomer]
 
SELECT AVG(Quantity)
     FROM[TbOrderDetails]
SELECT COUNT ( EmployeeID)
      FROM [TbEmployee]
SELECT OrderID , orderdate , CustomerID , CustomerName ,Phone, customerAddress
    FROM[TbOrder] JOIN TbCustomer
     ON [TbOrder] CustomerID = Customer.ID
SELECT Quantity , CustomerName, CustomerName , CustomerAddress , Country
	FROM [TbOrderDetails] O RIGHT JOIN TbCustomer C
    ON O.CuctomerID =C.ID
      WHERE Quantity IS NULL
SELECT C.Name AS CustomerName , E.Name AS EmployeeName
        FROM Customer C FULL JOIN Employee E
         ON Customer C = Employee E
           ORDER BY Customer C ,  Employee E 
SELECT B.Name AS CustomerName 
     A.Name AS CustomerName2
     B.Country 
  FROM CustomerName A, CustomerName B
         WHERE A.Id <> B.ID
         AND A.Country = B.Country
          ORDER BY A.Country 
INSERT INTO TbCustomer (CustomerName,postal code, Country, Phone)
        VALUES ('ali','1282156','Egypt','020115566846')
INSERT INTO  TbOrderDetails (ProductName, productCode, Quantity)
        VALUES ('sandy bag', 'a16825', 'Skagen 21', '1000)
INSERT INTO TbEmployee(EmployeeName, JobTitle, officeCode )
         VALUES (' Omar Khiry', 'accountant','122')
 
UPDATE TbCustomers SET CustomerName = 'Judy'
            WHERE CustomerID = 8000;
UPDATE TbProduct
      SET IsDiscontinued = 1
        WHERE ProductID = 46
UPDATE Tbemployee
       SET ID = '99', Phone = '(0)1-953530', JOBTITLE = 'accounting manager'
      WHERE Id = 15
UPDATE TbProduct
       SET IsDiscontinued = 1
      WHERE UniquePRICE > 50
