USE LTW_24133044;
GO

-- Xóa dữ liệu cũ nếu có
DELETE FROM rating;
DELETE FROM book_author;
DELETE FROM author;
DELETE FROM books;
GO

-- Thêm Tác giả
INSERT INTO author (author_name, date_of_birth) VALUES 
('Nguyen Nhat Anh', '1955-05-07'),
('To Hoai', '1920-09-27'),
('Nam Cao', '1915-10-29');
GO

-- Thêm Sách
INSERT INTO books (isbn, title, publisher, price, description, publish_date, cover_image, quantity) VALUES 
(123456, 'Mat Biec', 'NXB Tre', 150.00, 'Truyen dai', '2019-01-01', 'https://via.placeholder.com/300x400?text=Mat+Biec', 50),
(123457, 'Toi Thay Hoa Vang Tren Co Xanh', 'NXB Tre', 120.00, 'Truyen dai', '2018-01-01', 'https://via.placeholder.com/300x400?text=Hoa+Vang', 40),
(123458, 'Cho Toi Xin Mot Ve Di Tuoi Tho', 'NXB Tre', 110.00, 'Truyen dai', '2015-01-01', 'https://via.placeholder.com/300x400?text=Tuoi+Tho', 60),
(123459, 'De Men Phieu Luu Ky', 'NXB Kim Dong', 80.00, 'Truyen thieu nhi', '2000-01-01', 'https://via.placeholder.com/300x400?text=De+Men', 100),
(123460, 'Chi Pheo', 'NXB Van Hoc', 90.00, 'Truyen ngan', '1990-01-01', 'https://via.placeholder.com/300x400?text=Chi+Pheo', 80);
GO

-- Map Sách với Tác giả
INSERT INTO book_author (bookid, author_id) VALUES 
((SELECT bookid FROM books WHERE isbn = 123456), (SELECT author_id FROM author WHERE author_name = 'Nguyen Nhat Anh')),
((SELECT bookid FROM books WHERE isbn = 123457), (SELECT author_id FROM author WHERE author_name = 'Nguyen Nhat Anh')),
((SELECT bookid FROM books WHERE isbn = 123458), (SELECT author_id FROM author WHERE author_name = 'Nguyen Nhat Anh')),
((SELECT bookid FROM books WHERE isbn = 123459), (SELECT author_id FROM author WHERE author_name = 'To Hoai')),
((SELECT bookid FROM books WHERE isbn = 123460), (SELECT author_id FROM author WHERE author_name = 'Nam Cao'));
GO

-- Thêm Rating test (giả sử có user id 1, bạn cần tạo user id 1 trước hoặc bỏ qua khóa ngoại nếu đang test cứng)
-- Lệnh insert dưới giả định bảng users đã có user đầu tiên.
INSERT INTO users (email, fullname, phone, passwd, signup_date, is_admin) 
VALUES ('test@gmail.com', 'Test User', 123, '123', GETDATE(), 0);

INSERT INTO rating (userid, bookid, rating, review_text) VALUES 
((SELECT TOP 1 id FROM users), (SELECT bookid FROM books WHERE isbn = 123456), 5, 'Hay qua'),
((SELECT TOP 1 id FROM users), (SELECT bookid FROM books WHERE isbn = 123456), 4, 'Doc duoc'),
((SELECT TOP 1 id FROM users), (SELECT bookid FROM books WHERE isbn = 123459), 5, 'Kinh dien');
GO
