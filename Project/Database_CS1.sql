-- Tạo cơ sở dữ liệu
CREATE DATABASE bookstoreDB;
USE bookstoreDB;

drop database bookstoredb;
-- Tạo bảng Roles
CREATE TABLE Roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) UNIQUE NOT NULL
);

-- Tạo bảng Users lưu thông tin người dùng
CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,  -- Lưu mật khẩu đã mã hóa
    email VARCHAR(100) NOT NULL,
    role_id INT NOT NULL DEFAULT 2,
    FOREIGN KEY (role_id) REFERENCES Roles(id)
);

-- Tạo bảng Books lưu thông tin sách
CREATE TABLE Books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    ImageURL VARCHAR(500),
    stock_quantity INT NOT NULL,
    book_description TEXT NOT NULL,
    status TINYINT DEFAULT 1  -- Thêm cột status với giá trị mặc định
);

-- Tạo bảng Orders lưu thông tin đơn hàng
CREATE TABLE Orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,  -- Liên kết với bảng Users
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_price DECIMAL(10,2) NOT NULL,
    status ENUM('Đang xử lý', 'Đã giao', 'Đã hủy') DEFAULT 'Đang xử lý',  -- Trạng thái đơn hàng
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

-- Tạo bảng OrderDetails lưu chi tiết đơn hàng
CREATE TABLE Order_Details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    quantity INT default 1,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,  -- Bỏ UNIQUE để có thể trùng email
    phone_number VARCHAR(20) NOT NULL,
    province_city TEXT NOT NULL,
    district TEXT NOT NULL,
    ward TEXT NOT NULL,
    street TEXT NOT NULL,
    note_order TEXT,
    total_price DECIMAL(10,2) NOT NULL,
    payment_method varchar(255) NOT NULL,
    order_status ENUM('Đang xử lý', 'Đã xử lý') NOT NULL
);

-- Thêm dữ liệu vào bảng Books
INSERT INTO Books(title, author, price, ImageURL, stock_quantity, book_description) VALUES
("Làm Bạn Với Bầu Trời", "Nguyễn Nhật Ánh", 88.000, "https://pibook.vn/upload/products/2020_04_13_11_18_55_1-390x510.jpg", 10, "Một câu chuyện giản dị, chứa đầy bất ngờ...");

-- Thêm dữ liệu vào bảng Users
INSERT INTO Users(username, password, email, role_id) VALUES
('admin', '123', 'admin@example.com', 1),
('user1', '123', 'john.doe@example.com', 2),
('user2', '123', 'jane.smith@example.com', 2),
('user3', '123', 'peter.parker@example.com', 2);

-- Thêm dữ liệu vào bảng Roles
INSERT INTO Roles(id, role_name) VALUES
(1, 'Admin'),
(2, 'User');

-- Thêm dữ liệu vào bảng Orders
INSERT INTO Orders(user_id, total_price, status) VALUES
(5, 250.000, 'Đang xử lý'),
(6, 420.000, 'Đã giao'),
(7, 180.000, 'Đang xử lý'),
(8, 300.000, 'Đã hủy');

-- Thêm dữ liệu vào bảng Order_Details
INSERT INTO Order_Details(book_id, full_name, email, phone_number, province_city, district, ward, street, note_order, total_price, payment_method, order_status) VALUES
( 3,  'Nguyễn Văn A', 'admin@example.com', '0901234567', 'Hà Nội', 'Hoàn Kiếm', 'Hàng Trống', '45 Lý Thường Kiệt', 'Giao hàng giờ hành chính', 250.000, 'Thanh toán khi nhận hàng', 'Đang xử lý'),
( 7, 'Trần Thị B', 'admin@example.com', '0987654321', 'TP. Hồ Chí Minh', 'Quận 1', 'Bến Nghé', '22 Nguyễn Huệ', 'Gọi trước khi giao', 250.000, 'Chuyển khoản qua internet banking', 'Đã xử lý'),
( 2, 'Lê Văn C', 'admin@example.com', '0912345678', 'Đà Nẵng', 'Hải Châu', 'Hòa Thuận Đông', '88 Trần Phú', NULL, 250.000, 'Thanh toán khi nhận hàng', 'Đang xử lý'),
( 4, 'Phạm Minh D', 'admin@example.com', '0934567890', 'Cần Thơ', 'Ninh Kiều', 'An Bình', '12 Võ Văn Kiệt', 'Không gọi điện', 250.000, 'Chuyển khoản qua internet banking', 'Đã xử lý');

insert into books(title, author, price, ImageURL, stock_quantity, book_description) VALUE ("Làm Bạn Với Bầu Trời","Nguyễn Nhật Ánh",88.000,"https://pibook.vn/upload/products/2020_04_13_11_18_55_1-390x510.jpg",10,"Một câu chuyện giản dị, chứa đầy bất ngờ cho tới trang cuối cùng. Và đẹp lộng lẫy, vì lòng vị tha và tình yêu thương, khiến mắt rưng rưng vì một nỗi mừng vui hân hoan. Cuốn sách như một đốm lửa thắp lên lòng khát khao sống tốt trên đời.");
insert into books(title, author, price, ImageURL, stock_quantity, book_description) VALUE ("Mắt Biếc","Nguyễn Nhật Ánh",77.000,"https://pibook.vn/upload/products/67d0ef3d3fc8897213c9a1f84ee561e1.jpg",10,"Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).");
insert into books(title, author, price, ImageURL, stock_quantity, book_description) VALUE ("Việt Nam Danh Tác - Số Đỏ","Vũ Trọng Phụng",60.000,"https://pibook.vn/upload/product-slide/07aef25a3e7d7b6e78f5184dbe3c842f.jpg",10,"Số Đỏ là một tiểu thuyết văn học của nhà văn Vũ Trọng Phụng, đăng ở Hà Nội báo từ số 40 ngày 7 tháng 10 năm 1936 và được in thành sách lần đầu vào năm 1938. ");
insert into books(title, author, price, ImageURL, stock_quantity, book_description) VALUE ("Trúng Số Độc Đắc","Vũ Trọng Phụng",38.000,"https://pibook.vn/upload/product-slide/tr%C3%BAngo.jpg",10,"Tiểu thuyết Trúng số độc đắc được Vũ Trọng Phụng viết năm 1938, lúc nhà văn 26 tuổi. Trúng số độc đắc có đầy đủ mọi yếu tố của một “tiểu thuyết luận đề”. Tác giả đã tận dụng mọi cơ hội để phát biểu những suy ngẫm, quan niệm của mình về con người, về cuộc sống. ");
insert into books(title, author, price, ImageURL, stock_quantity, book_description) VALUE ("Số Đỏ","Vũ Trọng Phụng",45.000,"https://pibook.vn/upload/product-slide/so-do-1.png",10,"Số Đỏ - cuốn sách nằm trong bộ Tủ sách Văn học trong nhà trường được Nhà xuất bản Kim Đồng tổ chức biên soạn nhằm giúp các bạn học sinh có một nền tảng kiến thức văn học phong phú, vững vàng. Bộ sách sẽ lần lượt giới thiệu tác phẩm của các tác giả thuộc nhiều trào lưu, thể loại, thời kì...");
insert into books(title, author, price, ImageURL, stock_quantity, book_description) VALUE ("Làm Đĩ","Vũ Trọng Phụng",38.500,"https://pibook.vn/upload/product-slide/lam-di-dinh-ti.png",10,"Trong văn học Việt Nam, Vũ Trọng Phụng luôn được biết đến như một nhà văn hiện thực xuất sắc, với những tác phẩm khắc họa sâu sắc và chân thực những góc tối của xã hội. Và 'Làm Đĩ', tiểu thuyết mới nhất được Đinh Tị phát hành, tiếp tục là một minh chứng hùng hồn cho tài năng và tâm huyết của ông trong việc phơi bày những bất công và thành kiến xã hội.");
insert into books(title, author, price, ImageURL, stock_quantity, book_description) VALUE ("Sống Mòn","Nam Cao",76.300,"https://pibook.vn/upload/product-slide/songmonnamcao.jpg",10,"Sống Mòn (Nhã Nam) là cuốn truyện ngắn, một tác phẩm mang đầy chất hiện thực và tự sự, đôi lúc cảm tưởng như đây là cuốn nhật ký cho một quãng đời của tác giả. ");
insert into books(title, author, price, ImageURL, stock_quantity, book_description) VALUE ("Chí Phèo","Nam Cao",35.300,"https://pibook.vn/upload/product-slide/chipheo-namcao%20-bia1_.u547.d20160404.t145748.jpg",10,"Chí Phèo (Minh Long) là tập truyện ngắn tái hiện bức tranh chân thực nông thôn Việt Nam trước 1945, nghèo đói, xơ xác trên con đường phá sản, bần cùng, hết sức thê thảm, người nông dân bị đẩy vào con đường tha hóa, lưu manh hóa. ");
insert into books(title, author, price, ImageURL, stock_quantity, book_description) VALUE ("Tuyển Tập Nam Cao","Nam Cao",35.300,"https://pibook.vn/upload/product-slide/nam_cao_900x900_a3239419db1b411fb23c070dca20f5dc_master.jpeg",10,"Tuyển Tập Nam Cao là tập hợp những truyện ngắn xuất sắc của nhà văn tài hoa này.");
insert into books(title, author, price, ImageURL, stock_quantity, book_description) VALUE ("Nàng Mona Lisa Cuối Cùng","Jonathan Santlofer",118.300,"https://pibook.vn/upload/product-slide/nang-mona-lisa-cuoi-cung-15012025.jpg",10,"Nàng Mona Lisa Cuối Cùng - Bí Ẩn Vụ Trộm Động Trời.");
insert into books(title, author, price, ImageURL, stock_quantity, book_description) VALUE ("Utopia - Địa Đàng Trần Gian","Thomas More",49.000 ,"https://pibook.vn/upload/product-slide/utopia-dia-dang-tran-gian-15012025.jpg",10,"Utopia - Địa Đàng Trần Gian: Hành Trình Đến Xứ Sở Lý Tưởng");
insert into books(title, author, price, ImageURL, stock_quantity, book_description) VALUE ("Hẹn Nhau Tháng Tám","Gabriel García Márquez",97.300 ,"https://pibook.vn/upload/product-slide/hen-nhau-thang-tam-24122024.jpg",10,"Hẹn Nhau Tháng Tám - Giảm 30% | Tiểu Thuyết Lãng Mạn | Pibook.vn - Khúc Bolero Về Tình Yêu Và Bí Ẩn");
insert into books(title, author, price, ImageURL, stock_quantity, book_description) VALUE ("Những Đứa Trẻ Thượng Lưu","Ngô Hiểu Lạc",94.500 ,"https://pibook.vn/upload/product-slide/nhung-dua-tre-thuong-luu-02012025.jpg",10,"Những Đứa Trẻ Thượng Lưu - Bước Vào Thế Giới Ảo Mộng");
insert into books(title, author, price, ImageURL, stock_quantity, book_description) VALUE ("Vũ Khúc Đoạn Tình","Stephanie Garber",118.300 ,"https://pibook.vn/upload/product-slide/vu-khuc-doan-tinh-19122024.jpg",10,"Vũ Khúc Đoạn Tình - Lời Nguyền Chết Chóc Và Mối Tình Mong Manh");
insert into books(title, author, price, ImageURL, stock_quantity, book_description) VALUE ("Ở Xứ Tự Do","V. S. Naipaul",117.600 ,"https://pibook.vn/upload/product-slide/o-xu-tu-do-20122024.jpg",10,"Ở Xứ Tự Do - Những Mảnh Đời Lưu Lạc");
insert into books(title, author, price, ImageURL, stock_quantity, book_description) VALUE ("Bản Chất Của Người","Han Kang",90.300,"https://pibook.vn/upload/product-slide/ban-chat-cua-nguoi-06122024.jpg",10,"Bản Chất Của Người - Cuộc Đấu Tranh Nội Tâm Đầy Day Dứt");
insert into books(title, author, price, ImageURL, stock_quantity, book_description) VALUE ("Chuyện Hứa Tam Quan Bán Máu","Dư Hoa",117.600,"https://pibook.vn/upload/product-slide/chuyen-hua-tam-quan-ban-mau-25112024.jpg",10,"Chuyện Hứa Tam Quan Bán Máu - Cuộc Đời Đầy Xót Xa Giữa Biển Đời Bão Táp");
insert into books(title, author, price, ImageURL, stock_quantity, book_description) VALUE ("Charlie Thương Nhớ","N.D Gomes",72.250,"https://pibook.vn/upload/product-slide/charlie-thuong-nho-13112024.jpg",10,"Charlie Thương Nhớ - Nỗi Đau Và Sự Tha Thứ");
insert into books(title, author, price, ImageURL, stock_quantity, book_description) VALUE ("Bà Nội Găngxtơ Tái Xuất!","David Walliams",108.500,"https://pibook.vn/upload/product-slide/ba-noi-gangxto-tai-xuat-13112024.jpg",10,"Bà Nội Găngxtơ Tái Xuất! - Cuộc Phiêu Lưu Mới Kịch Tính");
insert into books(title, author, price, ImageURL, stock_quantity, book_description) VALUE ("Những Đứa Con Của Nửa Đêm","Salman Rushdie",168.000,"https://pibook.vn/upload/product-slide/nhung-dua-con-cua-nua-dem-02112024.jpg",10,"Những Đứa Con Của Nửa Đêm: Huyền Ảo, Đồ Sộ Và Kỳ Thú!");


SELECT * FROM Books;
SELECT * FROM Orders;
SELECT * FROM Order_Details;
SELECT * FROM Users;
SELECT * FROM Roles;




