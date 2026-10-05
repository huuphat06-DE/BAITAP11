CREATE DATABASE LTW_24133044;
GO
USE LTW_24133044;
GO

CREATE TABLE users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    email VARCHAR(50),
    fullname NVARCHAR(50),
    phone INT,
    passwd VARCHAR(32),
    signup_date DATETIME,
    last_login DATETIME,
    is_admin BIT
);

CREATE TABLE books (
    bookid INT IDENTITY(1,1) PRIMARY KEY,
    isbn INT,
    title VARCHAR(200),
    publisher VARCHAR(100),
    price DECIMAL(12, 0),
    description TEXT,
    publish_date DATE,
    cover_image VARCHAR(100),
    quantity INT
);

CREATE TABLE author (
    author_id INT IDENTITY(1,1) PRIMARY KEY,
    author_name VARCHAR(100),
    date_of_birth DATE
);

CREATE TABLE book_author (
    bookid INT,
    author_id INT,
    PRIMARY KEY (bookid, author_id),
    FOREIGN KEY (bookid) REFERENCES books(bookid) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES author(author_id) ON DELETE CASCADE
);

CREATE TABLE rating (
    userid INT,
    bookid INT,
    rating TINYINT,
    review_text TEXT,
    PRIMARY KEY (userid, bookid),
    FOREIGN KEY (userid) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (bookid) REFERENCES books(bookid) ON DELETE CASCADE
);

CREATE TABLE orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    userid INT,
    order_date DATETIME DEFAULT GETDATE(),
    total_amount DECIMAL(10, 2),
    status NVARCHAR(50), 
    shipping_address NVARCHAR(255),
    payment_method VARCHAR(50) DEFAULT 'COD',
    FOREIGN KEY (userid) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE order_items (
    order_item_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT,
    bookid INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (bookid) REFERENCES books(bookid) ON DELETE CASCADE
);


-- Chèn dữ liệu mẫu cho bảng books
SET IDENTITY_INSERT books ON;
INSERT INTO books (bookid, isbn, title, publisher, price, quantity) VALUES 
(1, 123456, N'Mắt Biếc', N'NXB Trẻ', 150000, 50),
(2, 123457, N'Tôi Thấy Hoa Vàng Trên Cỏ Xanh', N'NXB Trẻ', 120000, 40),
(3, 123459, N'Dế Mèn Phiêu Lưu Ký', N'NXB Kim Đồng', 85000, 100),
(4, 123460, N'Chí Phèo', N'NXB Văn Học', 90000, 30);
SET IDENTITY_INSERT books OFF;
