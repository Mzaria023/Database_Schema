Create Database SmartChoice 

Use SmartChoice

Create Table Category
(
  CategoryID INT Primary Key IDENTITY(1,1),
  CategoryName Varchar(100) NOT NULL,
  CategoryImageUrl Varchar(Max) NOT NULL,
  IsActive BIT NOT NULL,
  CreatedDate DateTime NOT NULL
)
Create Table SubCategory
(
  SubCategoryID INT Primary Key IDENTITY(1,1),
  SubCategoryName Varchar(100) NOT NULL,
  CategoryID INT Foreign Key References Category(CategoryID) ON DELETE CASCADE NOT NULL,
  IsActive BIT NOT NULL,
  CreatedDate DateTime NOT NULL
)
CREATE TABLE Product
(
  ProductID INT PRIMARY KEY IDENTITY(1,1),
  ProductName VARCHAR(100) NOT NULL,
  ProductDescription VARCHAR(100) NOT NULL,
  Price DECIMAL(18,2) NOT NULL,
  Quantity INT NOT NULL,
  Size VARCHAR(30) NOT NULL,
  Color VARCHAR(50) NOT NULL,
  CompanyName VARCHAR(100) NOT NULL,
  CategoryID INT NOT NULL,
  SubCategoryID INT NOT NULL,
  Sold INT NOT NULL,
  IsCustomized BIT NOT NULL,
  IsActive BIT NOT NULL,
  CreatedDate DATETIME NOT NULL,
  
  -- Foreign Key Constraints
  CONSTRAINT FK_Product_Category FOREIGN KEY (CategoryID) 
    REFERENCES Category(CategoryID) 
    ON DELETE CASCADE,
  
  CONSTRAINT FK_Product_SubCategory FOREIGN KEY (SubCategoryID) 
    REFERENCES SubCategory(SubCategoryID) 
    ON DELETE No Action
);

Create Table ProductImages 
(
ImageID INT Primary Key IDENTITY(1,1) Not Null,
ImageUrl Varchar (Max) Not Null,
ProductID INT Foreign Key References Product(ProductID) ON DELETE CASCADE NOT NULL,
DefaultImage BIT Null
)

Create Table Roles
(
RoleID INT Primary Key,
RoleName Varchar (100) Not Null
)
Insert into Roles Values (1, 'Admin')
Insert into Roles Values (2, 'Customer')

Create Table Users
(
  UserID INT Primary Key IDENTITY(1,1),
  Name Varchar(50) NOT NULL,
  UserName Varchar(50) NOt NULL Unique,
  Mobile Varchar(50) NOT NULL,
  Email Varchar(50) NOT NULL,
  Address Varchar (Max)Not Null,
  PostalCode Varchar(50) Not Null,
  Password Varchar (50) Not Null,
  ImageUrl Varchar NOT NULL,
  RoleID INT Foreign Key References Roles(RoleID) ON DELETE CASCADE NOT NULL,
  CreatedDate DateTime NOT NULL
)

Create Table ProductReview
(
  ReviewID INT Primary Key IDENTITY(1,1),
  Rating INT NOT NULL,
  Comment Varchar(50) NOt NULL,
  ProductID INT Foreign Key References Product(ProductID) ON DELETE CASCADE NOT NULL,
  UserID INT Foreign Key References Users(UserID) ON DELETE No Action NOT NULL,
  CreatedDate DateTime NOT NULL
)

Create Table WishList
(
  WishListID INT Primary Key IDENTITY(1,1),
  ProductID INT Foreign Key References Product(ProductID) ON DELETE CASCADE NOT NULL,
  UserID INT Foreign Key References Users(UserID) ON DELETE NO Action NOT NULL,
  CreatedDate DateTime NOT NULL
)

Create Table Cart
(
  CartID INT Primary Key IDENTITY(1,1),
  ProductID INT Foreign Key References Product(ProductID) ON DELETE CASCADE NOT NULL,
  Quantity INT NOT NULL,
  UserID INT Foreign Key References Users(UserID) ON DELETE No Action NOT NULL,
  CreatedDate DateTime NOT NULL
)

Create Table Contact
(
  ContactID INT Primary Key IDENTITY(1,1),
  Name Varchar(50) Not Null,
  Email Varchar(50) NOT NULL,
  Subject Varchar(100) NOt NULL,
  Message Varchar(Max) NOT NULL,
  CreatedDate DateTime NOT NULL
)
 Create Table Payment
 (
 PaymentID INT Primary Key IDENTITY(1,1),
 Name Varchar(50) Not Null,
 CardNumber Varchar(50) NOT NULL,
 ExpiryDate Varchar(30) NOt NULL ,
 CvvNumber INT NOT NULL,
 Address Varchar (Max)Not Null,
 PaymentMode Varchar (50) NOT NULL
 )
 
 CREATE TABLE Orders
(
  OrderID INT PRIMARY KEY IDENTITY(1,1),
  OrderNumber VARCHAR(50) NOT NULL,  
  ProductID INT NOT NULL,
  Quantity INT NOT NULL,
  UserID INT NOT NULL,
  Status VARCHAR(50),
  PaymentID INT NOT NULL,
  OrderDate DATETIME NOT NULL,
  IsCancelled BIT DEFAULT 0,
  
  -- Foreign Key Constraints
  CONSTRAINT FK_Orders_Product FOREIGN KEY (ProductID) 
    REFERENCES Product(ProductID) 
    ON DELETE CASCADE,
  
  CONSTRAINT FK_Orders_Users FOREIGN KEY (UserID) 
    REFERENCES Users(UserID) 
    ON DELETE NO ACTION,
  
  CONSTRAINT FK_Orders_Payment FOREIGN KEY (PaymentID) 
    REFERENCES Payment(PaymentID) 
    ON DELETE NO ACTION
);
