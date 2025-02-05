CREATE DATABASE DeLuaStoreDB;
GO
USE   DeLuaStoreDB;
GO
CREATE TABLE Admin(
    adminId int primary key,
    username varchar(50),
    [password] varchar(50),
    email varchar(50)
);

CREATE TABLE [User](
    userId int primary key,
    [name] nvarchar(50),
    username varchar(50),
    [password] varchar(50),
    email varchar(50),
    phoneNum varchar(50),
    birthday date,
    createDate date,
    gender varchar(10),
    [status] varchar(10),
)
CREATE TABLE Banner(
	bannerId int primary key,
	bannerName nvarchar,
	createDate date,
	bannerPath nvarchar,
)
CREATE TABLE Brand(
    brandId int primary key,
    brandName nvarchar(50),
    createDate date,
    imagePath nvarchar(50),
);
CREATE TABLE Category(
    categoryId int primary key,
    categoryName nvarchar(50),
);

CREATE TABLE Product(
    productId int primary key,
    proName nvarchar(50),
    brandId int references brand(brandId),
    categoryId int references  category(categoryId),
    imagePath nvarchar(50),
    [description] nvarchar(50)
);

CREATE TABLE Variant(
    variantId int primary key,
    productId int references  product(productId),
    color nvarchar(50),
    imagePath nvarchar(50),
    display int,
    stock int,
    ram int,
    storage int,
    price money,
    discount DECIMAL(18, 0),
);

CREATE TABLE Address(
    userId int primary key,
    street nvarchar(50),
    [state] nvarchar(50),
    city nvarchar(50),
    FOREIGN KEY (userId) REFERENCES [User](userId)
);

CREATE TABLE [Order](
    orderId int primary key,
    orderDate date,
    [status] varchar(10),
    phoneNum varchar(50),
    totalPrice money,   
    userId int references  [User](userId),    
);
CREATE TABLE OrderDetail(
    variantId int references  variant(variantId),
    orderId int references  [Order](orderId),
    quantity int,
    price money,
    discount DECIMAL(18, 0),
    PRIMARY KEY (orderId, variantId)
);
CREATE TABLE [User] (
    userId int primary key,
    [name] nvarchar(50),
    username varchar(50),
    [password] varchar(50),
    email varchar(50),
    phoneNum varchar(50),
    birthday date,
    createDate date,
    gender varchar(10),
    [status] varchar(10)
);
