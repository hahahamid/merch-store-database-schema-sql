-- Create Users Table

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,

     -- Other user-related columns here

    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Address TEXT,
    PhoneNumber VARCHAR(20),
    SocialMediaLinks TEXT,
    AccountCreationDate DATE,
    LastLoginDate DATE,
    AccountStatus VARCHAR(20),
    Preferences JSON, -- One can use JSON or another format for preferences
    SecurityQuestion VARCHAR(255),
    SecurityAnswer VARCHAR(255),
    AccountType VARCHAR(20)

   
);

-- Create Products Table

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL,
    Category VARCHAR(50) NOT NULL,
    ImageURL VARCHAR(255),
    
    -- Other product-related columns here
    
    Manufacturer VARCHAR(100),
    Weight DECIMAL(10, 2),
    Dimensions VARCHAR(50),
    SKU VARCHAR(20),
    ProductURL VARCHAR(255),
    ReleaseDate DATE,
    Warranty VARCHAR(100),
    Material VARCHAR(50),
    Color VARCHAR(50),
    ProductRating DECIMAL(3, 2),
    TotalReviews INT,
    InStock BOOLEAN,

);

-- Create Orders Table

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    UserID INT,
    OrderDate DATE NOT NULL,
    TotalPrice DECIMAL(10, 2) NOT NULL,
    OrderStatus VARCHAR(20) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Order Items Table

CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    Subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create Payment Transactions Table

CREATE TABLE PaymentTransactions (
    TransactionID INT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATE NOT NULL,
    PaymentMethod VARCHAR(20) NOT NULL,
    TransactionAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Create Shipping Information Table

CREATE TABLE ShippingInformation (
    ShippingInfoID INT PRIMARY KEY,
    OrderID INT,
    ShippingAddress TEXT,
    ShippingDate DATE NOT NULL,
    TrackingNumber VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Create Reviews and Ratings Table

CREATE TABLE ReviewsRatings (
    ReviewID INT PRIMARY KEY,
    ProductID INT,
    UserID INT,
    Rating INT NOT NULL,
    ReviewText TEXT,
    DatePosted DATE NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Create Categories Table

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
);

-- Create Subcategories Table (if needed)

CREATE TABLE Subcategories (
    SubcategoryID INT PRIMARY KEY,
    SubcategoryName VARCHAR(50) NOT NULL,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
