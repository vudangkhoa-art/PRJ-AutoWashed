CREATE DATABASE AutoWashPro;
GO
USE AutoWashPro;
GO

-- 1. BẢNG HẠNG THÀNH VIÊN 
CREATE TABLE CustomerTiers (
    TierID INT PRIMARY KEY IDENTITY(1,1),
    TierName NVARCHAR(50) NOT NULL UNIQUE,      -- Member, Silver, Gold, Platinum
    MinWashes INT DEFAULT 0,                    -- Số lượt rửa tối thiểu để lên đời
    MinSpend DECIMAL(12,2) DEFAULT 0,           -- Hoặc số tiền tối thiểu (2M, 6M, 15M)
    PointMultiplier DECIMAL(3,2) DEFAULT 1.00,  -- Hệ số điểm: 1.0, 1.1, 1.2, 1.3
    BookingWindowDays INT DEFAULT 7             -- Cửa sổ đặt trước: 7, 10, 12, 14 ngày
);

-- 2. BẢNG KHÁCH HÀNG 
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100) NOT NULL,
    PhoneNumber NVARCHAR(20) NOT NULL UNIQUE,   
    Password NVARCHAR(255) NOT NULL,            -- Bắt buộc phải có để Login trên Web
    Email NVARCHAR(100) UNIQUE,
    TierID INT NOT NULL DEFAULT 1,              -- Mặc định mới đăng ký là Member (TierID = 1)
    CurrentPoints INT DEFAULT 0,                -- Điểm hiện tại để đổi thưởng
    TotalSpend DECIMAL(12,2) DEFAULT 0,         -- Tổng tiền đã tiêu 
    CreatedAt DATETIME DEFAULT GETDATE(),
    Status BIT DEFAULT 1,
    CONSTRAINT FK_Customers_Tiers FOREIGN KEY (TierID) REFERENCES CustomerTiers(TierID)
);

-- 3. BẢNG XE 
CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    LicensePlate NVARCHAR(20) NOT NULL UNIQUE,  -- Biển số xe liên kết tài khoản
    Brand NVARCHAR(50),
    Model NVARCHAR(50),
    Color NVARCHAR(30),
    CONSTRAINT FK_Vehicles_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- 4. BẢNG DỊCH VỤ
CREATE TABLE Services (
    ServiceID INT PRIMARY KEY IDENTITY(1,1),
    ServiceName NVARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    DurationMinutes INT
);

-- 5. BẢNG ĐẶT LỊCH VÀ THANH TOÁN 
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    VehicleID INT NOT NULL,
    ServiceID INT NOT NULL,
    BookingDate DATE NOT NULL,
    BookingTime TIME,
    BookingStatus NVARCHAR(30) DEFAULT 'Pending', -- Pending, Approved, Completed, Cancelled
    TotalAmount DECIMAL(10,2) NOT NULL,           -- Giá tiền thực tế
    PaymentStatus NVARCHAR(30) DEFAULT 'Unpaid',  -- Unpaid, Paid
    PointsEarned INT DEFAULT 0,                   -- Số điểm cộng được từ hóa đơn này
    CreatedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Bookings_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    CONSTRAINT FK_Bookings_Vehicles FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID),
    CONSTRAINT FK_Bookings_Services FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);

-- 6. BẢNG QUÀ TẶNG / PHẦN THƯỞNG ĐỔI ĐIỂM
CREATE TABLE Rewards (
    RewardID INT PRIMARY KEY IDENTITY(1,1),
    RewardName NVARCHAR(100) NOT NULL,            -- Ví dụ: "Free Waxing", "Discount 50k"
    RequiredPoints INT NOT NULL,                  -- Ví dụ: 300 points
    Description NVARCHAR(255)
);

-- 7. BẢNG LỊCH SỬ ĐỔI QUÀ
CREATE TABLE RewardRedemptions (
    RedemptionID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    RewardID INT NOT NULL,
    RedeemedAt DATETIME DEFAULT GETDATE(),
    CONSTRAINT FK_Redemptions_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    CONSTRAINT FK_Redemptions_Rewards FOREIGN KEY (RewardID) REFERENCES Rewards(RewardID)
);

-- 8.PROMOTIONS
CREATE TABLE Promotions ( 
    PromotionID INT PRIMARY KEY IDENTITY(1,1), 
    PromotionTitle NVARCHAR(100) NOT NULL, 
    Description NVARCHAR(255), 
    DiscountPercent DECIMAL(5,2), 
    StartDate DATE, 
    EndDate DATE, 
    Status BIT DEFAULT 1 
);


---------------------------------------------------
-- INSERT CUSTOMER TIERS
---------------------------------------------------

INSERT INTO CustomerTiers
(
    TierName,
    MinWashes,
    MinSpend,
    PointMultiplier,
    BookingWindowDays
)
VALUES
('Member', 1, 0, 1.00, 7),

('Silver', 5, 2000000, 1.10, 10),

('Gold', 15, 6000000, 1.20, 12),

('Platinum', 30, 15000000, 1.30, 14);
GO

---------------------------------------------------
-- INSERT CUSTOMERS
---------------------------------------------------

INSERT INTO Customers
(
    FullName,
    PhoneNumber,
    Password,
    Email,
    TierID,
    CurrentPoints,
    TotalSpend
)
VALUES
(
    'Nguyen Van A',
    '0901234567',
    '123456',
    'vana@gmail.com',
    1,
    100,
    500000
),

(
    'Tran Thi B',
    '0912345678',
    '123456',
    'thib@gmail.com',
    1,
    300,
    2500000
);
GO

---------------------------------------------------
-- INSERT VEHICLES
---------------------------------------------------

INSERT INTO Vehicles
(
    CustomerID,
    LicensePlate,
    Brand
)
VALUES
(1, '51A-12345', 'Toyota'),

(1, '51G-67890', 'Honda'),

(2, '43A-99999', 'Mazda');
GO

---------------------------------------------------
-- INSERT SERVICES
---------------------------------------------------

INSERT INTO Services
(
    ServiceName,
    Price,
    DurationMinutes
)
VALUES
(
    'Premium Wash',
    250000,
    60
),

(
    'Interior Cleaning',
    400000,
    90
),

(
    'Basic Wash',
    100000,
    30
);
GO

---------------------------------------------------
-- INSERT BOOKINGS
---------------------------------------------------

INSERT INTO Bookings
(
    CustomerID,
    VehicleID,
    ServiceID,
    BookingDate,
    BookingStatus,
    TotalAmount,
    PaymentStatus,
    PointsEarned
)
VALUES
(
    1,
    1,
    1,
    '2026-05-20 08:00:00',
    'Completed',
    250000,
    'Paid',
    250
),

(
    2,
    3,
    2,
    '2026-05-21 10:30:00',
    'Pending',
    400000,
    'Unpaid',
    0
);
GO

---------------------------------------------------
-- INSERT REWARDS
---------------------------------------------------

INSERT INTO Rewards
(
    RewardName,
    RequiredPoints,
    Description
)
VALUES
(
    'Free Waxing',
    300,
    'Free waxing service'
),

(
    'Discount 50K',
    200,
    'Get 50,000 VND discount'
);
GO

---------------------------------------------------
-- INSERT REWARD REDEMPTIONS
---------------------------------------------------

INSERT INTO RewardRedemptions
(
    CustomerID,
    RewardID
)
VALUES
(1, 1),

(2, 2);
GO




