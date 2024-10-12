 -- Insert data into Brand table with imagePath 'brand.png'
INSERT INTO Brand (brandId, brandName, createDate, imagePath)
VALUES
(1, 'Oppo', GETDATE(), 'brand_oppo.png'),
(2, 'Samsung', GETDATE(), 'brand_samsung.png'),
(3, 'Apple', GETDATE(), 'brand_apple.png'),
(4, 'Lenovo', GETDATE(), 'brand_lenovo.png'),
(5, 'Huawei', GETDATE(), 'brand_huawei.png'),
(6, 'Google', GETDATE(), 'brand_google.png'),
(7, 'Xiaomi', GETDATE(), 'brand_xiaomi.png'),
(8, 'Vivo', GETDATE(), 'brand_vivo.png'),
(9, 'Acer', GETDATE(), 'brand_acer.png'),
(10, 'Dell', GETDATE(), 'brand_dell.png'),
(11, 'HP', GETDATE(), 'brand_hp.png'),
(12, 'Asus', GETDATE(), 'brand_asus.png');

Go
-- Insert data into Category table
INSERT INTO Category (categoryId, categoryName)
VALUES
(1, 'Phone'),
(2, 'Tablet'),
(3, 'Laptop');

Go
-- Insert data into Product table
INSERT INTO Product (productId, proName, brandId, categoryId, imagePath, [description])
VALUES
-- Oppo
(1, 'A17K', 1, 1, 'oppo_a17k_yellow.png', 'Oppo A17K'),
(2, 'A77s', 1, 1, 'oppo_a77s_blue.png', 'Oppo A77s'),
(3, 'A78', 1, 1, 'oppo_a78_green.png', 'Oppo A78'),
(4, 'Find n3 flip', 1, 1, 'oppo_findn3flip_yellow.png', 'Oppo Find n3 flip'),
(5, 'Find X5 Pro', 1, 1, 'oppo_findx5pro_black.png', 'Oppo Find X5 Pro'),
(6, 'Reno 8', 1, 1, 'oppo_reno8_yellow.png', 'Oppo Reno 8'),
(7, 'Reno 10', 1, 1, 'oppo_reno10_blue.png', 'Oppo Reno10'),

-- Samsung
(8, 'Galaxy S23', 2, 1, 'samsung_galaxys23_pink.png', 'Samsung Galaxy S23'),
(9, 'Galaxy S23 Ultra', 2, 1, 'samsung_galaxys23ultra_pink.png', 'Samsung Galaxy S23 Ultra'),
(10, 'Galaxy S24', 2, 1, 'samsung_galaxys24_white.png', 'Samsung Galaxy S24'),
(11, 'Galaxy Tab A9+ plus', 2, 2, 'samsung_galaxytaba9plus_gray.png', 'Samsung Galaxy Tab A9+ plus'),
(12, 'Galaxy Tab S6 Lite', 2, 2, 'samsung_galaxytabs6lite_mint.png', 'Samsung Galaxy Tab S6 Lite'),
(13, 'Galaxy Tab S9 FE+', 2, 2, 'samsung_galaxytabs9feplus_gray.png', 'Samsung Galaxy Tab S9 FE+'),
(14, 'Galaxy Z Flip 3', 2, 1, 'samsung_galaxyzflip3_pink.png', 'Samsung Galaxy Z Flip 3'),
(15, 'Galaxy Z Flip 4', 2, 1, 'samsung_galaxyzflip4_blue.png', 'Samsung Galaxy Z Flip 4'),
(16, 'Galaxy Z Fold 4', 2, 1, 'samsung_galaxyzfold4_black.png', 'Samsung Galaxy Z Fold 4'),

-- Apple
(17, 'iPad 11 inch', 3, 2, 'apple_ipad11inch_black.png', 'Apple iPad 11 inch'),
(18, 'iPad Air 6 M2', 3, 2, 'apple_ipadair6m2_starlight.png', 'Apple iPad Air 6 M2'),
(19, 'iPad Air M2', 3, 2, 'apple_ipadairm2_purple.png', 'Apple iPad Air M2'),
(20, 'iPad Gen 10', 3, 2, 'apple_ipadgen10_yellow.png', 'Apple iPad Gen 10'),
--(21, 'iPad Gen 11', 3, 2, 'apple_ipadgen11_pink.png', 'Apple iPad Gen 11'),
--(22, 'iPad Gen 12', 3, 2, 'apple_ipadgen12_blue.png', 'Apple iPad Gen 12'),
(23, 'iPad Pro M4', 3, 2, 'apple_ipadprom4_black.png', 'Apple iPad Pro M4'),
(24, 'iPhone 12 Pro', 3, 1, 'apple_iphone12pro_blue.png', 'Apple iPhone 12 Pro'),
(25, 'iPhone 12 Pro Max', 3, 1, 'apple_iphone12promax_silver.png', 'Apple iPhone 12 Pro Max'),
(26, 'iPhone 13', 3, 1, 'apple_iphone13_gold.png', 'Apple iPhone 13'),
(27, 'iPhone 13 Pro', 3, 1, 'apple_iphone13pro_green.png', 'Apple iPhone 13 Pro'),
(28, 'iPhone 15', 3, 1, 'apple_iphone15_black.png', 'Apple iPhone 15'),
(29, 'iPhone 15 128GB', 3, 1, 'apple_iphone15128gb_blue.png', 'Apple iPhone 15 128GB'),
(30, 'iPhone 15 Plus', 3, 1, 'apple_iphone15plus_green.png', 'Apple iPhone 15 Plus'),

-- Lenovo
(31, 'Tab P11 gen 2', 4, 2, 'lenovo_tabp11gen2_grey.png', 'Lenovo Tab P11 gen 2'),
(32, 'Tab P12', 4, 2, 'lenovo_tabp12_grey.png', 'Lenovo Tab P12'),
(33, 'Ideapad', 4, 3, 'lenovo_ideapad_black.png', 'Lenovo Ideapad'),
(34, 'Legion Pro', 4, 3, 'lenovo_legionpro_black.png', 'Lenovo Legion Pro'),
(35, 'Thinkpad P16 Gen 2', 4, 3, 'lenovo_thinkpadp16gen2_black.png', 'Lenovo Thinkpad P16 Gen 2'),
(36, 'Thinkpad X1 Carbon', 4, 3, 'lenovo_thinkpadx1carbon_silver.png', 'Lenovo Thinkpad X1 Carbon'),
(37, 'Yoga C94', 4, 3, 'lenovo_yogac94_silver.png', 'Lenovo Yoga C94'),

-- Huawei
(38, 'Matepad', 5, 2, 'huawei_matepad_grey.png', 'Huawei Matepad'),

-- 6.Google
(39, 'Pixel 4 XL', 6, 1, 'google_pixel4xl_black.png', 'Google Pixel 4 XL'),

-- Xiaomi
(40, 'Redmi Note 10', 7, 1, 'xiaomi_redminote10_black.png', 'Xiaomi Redmi Note 10'),
(41, 'Redmi Note 10S', 7, 1, 'xiaomi_redminote10s_black.png', 'Xiaomi Redmi Note 10S'),
(42, 'Redmi Note 11', 7, 1, 'xiaomi_redminote11_black.png', 'Xiaomi Redmi Note 11'),

-- Vivo
(43, 'Y16', 8, 1, 'vivoy16_black.png', 'Vivo Y16'),

-- Acer
(44, 'Aspire 5', 9, 3, 'acer_aspire5_black.png', 'Acer Aspire 5'),
(45, 'Chromebook Spin 713', 9, 3, 'acer_chromebookspin713_black.png', 'Acer Chromebook Spin 713'),
(46, 'Concept TD 7', 9, 3, 'acer_concepttd7_white.png', 'Acer Concept TD 7'),
(47, 'Notebook Nitro V15', 9, 3, 'acer_notebook_nitrov15_black.png', 'Acer Notebook Nitro V15'),
(48, 'Predator Helios 300', 9, 3, 'acer_predatorhelios300_black.png', 'Acer Predator Helios 300'),
(49, 'Swift 14', 9, 3, 'acer_swift14_silver.png', 'Acer Swift 14'),

-- Dell
(50, 'Alienware M17', 10, 3, 'dell_alienwarem17_black.png', 'Dell Alienware M17'),
(51, 'Inspiron 15700', 10, 3, 'dell_inspiron15700_black.png', 'Dell Inspiron 15700'),
(52, 'Notebook Latitude 7640', 10, 3, 'dell_notebooklatitude7640_silver.png', 'Dell Notebook Latitude 7640'),
(53, 'XPS 139315', 10, 3, 'dell_xps139315_white.png', 'Dell XPS 139315'),
(54, 'XPS 59500', 10, 3, 'dell_xps59500_white.png', 'Dell XPS 59500'),

-- HP
(55, 'Elitebook645', 11, 3, 'hp_elitebook645_white.png', 'HP Elitebook645'),
(56, 'Envy 17', 11, 3, 'hp_envy17_white.png', 'HP Envy 17'),
(57, 'Pavilion Aero 13', 11, 3, 'hp_pavilionaero13_white.png', 'HP Pavilion Aero 13'),
(58, 'Spectre X36', 11, 3, 'hp_spectrex36_gold.png', 'HP Spectre X36'),

-- Lenovo (remaining)
(59, 'Thinkpad X1 Carbon', 4, 3, 'lenovo_thinkpadx1carbon_silver.png', 'Lenovo Thinkpad X1 Carbon'),

-- Asus
(60, 'Proat Studiobook Pro 16', 12, 3, 'asus_proatstudiobookpro16_black.png', 'Asus Proat Studiobook Pro 16');

Go

-- Insert data into Variant table
INSERT INTO Variant (variantId, productId, color, imagePath, display, stock, ram, storage, price, discount)
VALUES
-- Oppo
(1, 1, 'Yellow', 'oppo_a17k_yellow.png', 6.5, 100, 8, 256.0, 599.99, 0),
(2, 1, 'Black', 'oppo_a17k_blue.png', 6.5, 150, 8, 256.0, 599.99, 0),
(3, 2, 'Blue', 'oppo_a77s_blue.png', 6.4, 120, 6, 128.0, 499.99, 0),
(4, 2, 'Black', 'oppo_a77s_black.png', 6.4, 150, 6, 128.0, 499.99, 0),
(5, 3, 'Green', 'oppo_a78_green.png', 6.6, 100, 12, 512.0, 799.99, 0),
(6, 3, 'Black', 'oppo_a78_black.png', 6.6, 150, 12, 512.0, 799.99, 0),
(7, 4, 'Yellow', 'oppo_findn3flip_yellow.png', 6.7, 100, 16, 1024.0, 1099.99, 0),
(8, 5, 'Black', 'oppo_findx5pro_black.png', 6.5, 120, 16, 512.0, 899.99, 0),
(9, 5, 'White', 'oppo_findx5pro_white.png', 6.5, 120, 16, 512.0, 899.99, 0),
(10, 6, 'Yellow', 'oppo_reno8_yellow.png', 6.5, 100, 8, 256.0, 599.99, 0),
(11, 7, 'Blue', 'oppo_reno10_blue.png', 6.4, 120, 8, 256.0, 599.99, 0),
(12, 8, 'Blue', 'oppo_reno11_blue.png', 6.6, 100, 8, 256.0, 599.99, 0),
(13, 8, 'Green black', 'oppo_reno11_greenblack.png', 6.6, 100, 8, 256.0, 599.99, 0),

-- Samsung
(14, 8, 'Pink', 'samsung_galaxys23_pink.png', 6.4, 120, 8, 256.0, 599.99, 0),
(15, 9, 'Pink', 'samsung_galaxys23ultra_pink.png', 6.8, 150, 12, 512.0, 799.99, 0),
(16, 10, 'White', 'samsung_galaxys24_white.png', 6.7, 120, 8, 256.0, 599.99, 0),
(17, 11, 'Gray', 'samsung_galaxytaba9plus_gray.png', 10.1, 200, 4, 64.0, 299.99, 0),
(18, 12, 'Mint', 'samsung_galaxytabs6lite_mint.png', 10.4, 180, 6, 128.0, 399.99, 0),
(19, 12, 'Chiffon Pink', 'samsung_galaxytabs6lite_chiffonpink.png', 10.4, 180, 6, 128.0, 399.99, 0),
(20, 13, 'Mint', 'samsung_galaxytabs9fe+_mint.png', 12.4, 220, 8, 256.0, 599.99, 0),
(21, 13, 'Gray', 'samsung_galaxytabs9fe+_gray.png', 12.4, 220, 8, 256.0, 599.99, 0),
(22, 14, 'Pink', 'samsung_galaxyzflip3_pink.png', 6.7, 150, 8, 256.0, 699.99, 0),
(23, 15, 'Blue', 'samsung_galaxyzflip4_blue.png', 6.7, 150, 8, 256.0, 699.99, 0),
(24, 16, 'Black', 'samsung_galaxyzfold4_black.png', 7.6, 200, 12, 512.0, 1399.99, 0),

-- Apple
(25, 17, 'Black', 'apple_ipad11inch_black.png', 11.0, 300, 6, 128.0, 699.99, 0),
(26, 18, 'Starlight', 'apple_ipadair6m2_starlight.png', 10.9, 300, 8, 256.0, 899.99, 0),
(27, 19, 'Purple', 'apple_ipadairm2_purple.png', 10.9, 300, 8, 256.0, 899.99, 0),
(28, 20, 'Yellow', 'apple_ipadgen10_yellow.png', 10.2, 250, 4, 64.0, 399.99, 0),
(29, 20, 'Pink', 'apple_ipadgen10_pink.png', 10.2, 250, 4, 64.0, 399.99, 0),
(30, 20, 'Blue', 'apple_ipadgen10_blue.png', 10.2, 250, 4, 64.0, 399.99, 0),
(31, 23, 'Black', 'apple_ipadprom4_black.png', 12.9, 350, 8, 256.0, 1099.99, 0),
(32, 23, 'Silver', 'apple_ipadprom4_silver.png', 12.9, 350, 8, 256.0, 1099.99, 0),
(33, 24, 'Blue', 'apple_iphone12pro_blue.png', 6.1, 400, 6, 128.0, 899.99, 0),
(34, 25, 'Silver', 'apple_iphone12promax_silver.png', 6.7, 450, 6, 256.0, 1099.99, 0),
(35, 26, 'Pink', 'apple_iphone13_pink.png', 6.1, 400, 6, 128.0, 999.99, 0),
(36, 27, 'Gold', 'apple_iphone13pro_gold.png', 6.1, 400, 6, 128.0, 1099.99, 0),
(37, 28, 'Green', 'apple_iphone15_green.png', 6.1, 400, 8, 256.0, 1199.99, 0),
(38, 28, 'Black', 'apple_iphone15_black.png', 6.1, 400, 8, 256.0, 1199.99, 0),
(39, 28, 'Blue', 'apple_iphone15_blue.png', 6.1, 400, 8, 256.0, 1199.99, 0),
(40, 28, 'Pink', 'apple_iphone15_pink.png', 6.1, 400, 8, 256.0, 1199.99, 0),

-- Lenovo
(41, 31, 'Grey', 'lenovo_tabp11gen2_grey.png', 11.0, 200, 4, 64.0, 299.99, 0),
(42, 32, 'Grey', 'lenovo_tabp12_grey.png', 12.6, 220, 8, 256.0, 599.99, 0),
(43, 33, 'Black', 'lenovo_ideapad_black.png', 15.6, 180, 8, 256.0, 499.99, 0),
(44, 34, 'Black', 'lenovo_legionpro_black.png', 15.6, 250, 12, 512.0, 899.99, 0),
(45, 35, 'Black', 'lenovo_thinkpadp16gen2_black.png', 15.6, 320, 16, 1024.0, 1299.99, 0),
(46, 36, 'Black', 'lenovo_thinkpadx1carbon_black.png', 15.6, 300, 16, 1024.0, 1499.99, 0),
(47, 37, 'Silver', 'lenovo_yogac940_silver.png', 15.6, 280, 16, 1024.0, 1399.99, 0),

-- Huawei
(48, 38, 'Grey', 'huawei_matepad_gray.png', 10.4, 220, 8, 256.0, 499.99, 0),

-- Google
(49, 39, 'Black', 'google_pixel4xl_black.png', 6.3, 300, 6, 128.0, 599.99, 0),

-- Xiaomi
(50, 40, 'Black', 'xiaomi_redminote10_black.png', 6.43, 250, 4, 64.0, 249.99, 0),
(51, 41, 'Black', 'xiaomi_redminote10s_black.png', 6.43, 250, 6, 128.0, 349.99, 0),
(52, 42, 'Black', 'xiaomi_redminote11_black.png', 6.6, 280, 8, 256.0, 499.99, 0),

-- Vivo
(53, 43, 'Black', 'vivo_y16_black.png', 6.51, 200, 4, 64.0, 199.99, 0),
(54, 43, 'Yellow', 'vivo_y16_yellow.png', 6.51, 200, 4, 64.0, 199.99, 0),

-- Acer
(55, 44, 'Black', 'acer_aspire5_black.png', 15.6, 220, 8, 256.0, 499.99, 0),
(56, 45, 'Black', 'acer_chromebookspin713_black.png', 15.6, 250, 8, 256.0, 599.99, 0),
(57, 46, 'White', 'acer_conceptd7_white.png', 15.6, 180, 12, 512.0, 799.99, 0),
(58, 47, 'Black', 'acer_notebooknitrov15_black.png', 15.6, 300, 16, 1024.0, 899.99, 0),
(59, 48, 'Black', 'acer_predatorhelios300_black.png', 15.6, 350, 16, 1024.0, 1299.99, 0),
(60, 49, 'Silver', 'acer_swift14_silver.png', 15.6, 280, 8, 256.0, 699.99, 0),

-- Dell
(61, 50, 'Black', 'dell_alienwarem17_black.png', 15.6, 400, 16, 1024.0, 1999.99, 0),
(62, 51, 'Black', 'dell_inspiron157000_black.png', 15.6, 300, 8, 256.0, 899.99, 0),
(63, 52, 'Silver', 'dell_notebooklatitude7640_silver.png', 15.6, 350, 8, 256.0, 999.99, 0),
(64, 53, 'White', 'dell_xps139315_white.png', 15.6, 320, 16, 512.0, 1299.99, 0),
(65, 54, 'White', 'dell_xps59500_white.png', 15.6, 350, 16, 1024.0, 1499.99, 0),

-- HP
(66, 55, 'White', 'hp_elitebook645_white.png', 15.6, 300, 8, 256.0, 899.99, 0),
(67, 56, 'White', 'hp_envy17_white.png', 15.6, 350, 16, 512.0, 1199.99, 0),
(68, 57, 'White', 'hp_pavilionaero13_white.png', 15.6, 320, 8, 256.0, 799.99, 0),
(69, 58, 'Gold', 'hp_spectrex360_gold.png', 15.6, 400, 16, 1024.0, 1599.99, 0),

-- Lenovo (remaining)
(70, 59, 'Silver', 'lenovo_thinkpadx1carbon_silver.png', 15.6, 300, 16, 1024.0, 1499.99, 0),

-- Asus
(71, 60, 'Black', 'asus_proartstudiobookpro16_black.png', 15.6, 350, 16, 1024.0, 1599.99, 0);

Go


-----------------------------User--------------------------------
--insert user data
INSERT INTO [User] (userId, [name], username, [password], email, phoneNum, birthday, createDate, gender, [status])
VALUES
(1, N'Nguyễn Văn An', 'nguyenvanan', 'password1', 'nguyenvanan@gmail.com', '0123456789', '1990-01-01', '2023-01-01', 'Male', 'Active'),
(2, N'Lê Thị Bích', 'lethibich', 'password2', 'lethibich@gmail.com', '0123456790', '1991-02-02', '2023-01-02', 'Female', 'Active'),
(3, N'Trần Văn Cường', 'tranvancuong', 'password3', 'tranvancuong@gmail.com', '0123456791', '1992-03-03', '2023-01-03', 'Male', 'Active'),
(4, N'Phạm Thị Dung', 'phamthidung', 'password4', 'phamthidung@gmail.com', '0123456792', '1993-04-04', '2023-01-04', 'Female', 'Disable'),
(5, N'Hoàng Văn Đông', 'hoangvandong', 'password5', 'hoangvandong@gmail.com', '0123456793', '1994-05-05', '2023-01-05', 'Male', 'Active'),
(6, N'Vũ Thị Hoa', 'vuthihoa', 'password6', 'vuthihoa@gmail.com', '0123456794', '1995-06-06', '2023-01-06', 'Female', 'Disable'),
(7, N'Đặng Văn Giang', 'dangvangiang', 'password7', 'dangvangiang@gmail.com', '0123456795', '1996-07-07', '2023-01-07', 'Male', 'Active'),
(8, N'Bùi Thị Hương', 'buithihuong', 'password8', 'buithihuong@gmail.com', '0123456796', '1997-08-08', '2023-01-08', 'Female', 'Disable'),
(9, N'Đỗ Văn Hải', 'dovanhai', 'password9', 'dovanhai@gmail.com', '0123456797', '1998-09-09', '2023-01-09', 'Male', 'Active'),
(10, N'Hà Thị Kim', 'hathikim', 'password10', 'hathikim@gmail.com', '0123456798', '1999-10-10', '2023-01-10', 'Female', 'Disable'),
(11, N'Tôn Văn Khang', 'tonvankhang', 'password11', 'tonvankhang@gmail.com', '0123456799', '2000-11-11', '2023-01-11', 'Male', 'Active'),
(12, N'Đinh Thị Lan', 'dinhthilan', 'password12', 'dinhthilan@gmail.com', '0123456800', '2001-12-12', '2023-01-12', 'Female', 'Active'),
(13, N'Ngô Văn Minh', 'ngovanminh', 'password13', 'ngovanminh@gmail.com', '0123456801', '2002-01-13', '2023-01-13', 'Male', 'Active'),
(14, N'Huỳnh Thị Ngọc', 'huynhthingoc', 'password14', 'huynhthingoc@gmail.com', '0123456802', '2003-02-14', '2023-01-14', 'Female', 'Disable'),
(15, N'Phan Văn Phúc', 'phanvanphuc', 'password15', 'phanvanphuc@gmail.com', '0123456803', '2004-03-15', '2023-01-15', 'Male', 'Active'),
(16, N'Võ Thị Quỳnh', 'vothiquynh', 'password16', 'vothiquynh@gmail.com', '0123456804', '2005-04-16', '2023-01-16', 'Female', 'Active'),
(17, N'Tô Văn Quân', 'tovanquan', 'password17', 'tovanquan@gmail.com', '0123456805', '2006-05-17', '2023-01-17', 'Male', 'Active'),
(18, N'Thái Thị Thanh', 'thaithithanh', 'password18', 'thaithithanh@gmail.com', '0123456806', '2007-06-18', '2023-01-18', 'Female', 'Disable'),
(19, N'Lương Văn Sơn', 'luongvanson', 'password19', 'luongvanson@gmail.com', '0123456807', '2008-07-19', '2023-01-19', 'Male', 'Active'),
(20, N'Triệu Thị Tuyết', 'trieuthituyet', 'password20', 'trieuthituyet@gmail.com', '0123456808', '2009-08-20', '2023-01-20', 'Female', 'Active'),
(21, N'Triệu Thị User', 'user', 'user', 'trieuthiuser@gmail.com', '0123456808', '2009-08-20', '2023-01-20', 'Male', 'Active');


--insert address data
go
-- Data for [Order] table
INSERT INTO [Order] (orderId, orderDate, [status], phoneNum, totalPrice, userId) VALUES
(1, '2023-07-01', 'pending', '0123456789', 150.00, 1),
(2, '2023-07-02', 'shipped', '0987654321', 200.00, 2),
(3, '2023-07-03', 'pending', '0123456788', 250.00, 3),
(4, '2023-07-04', 'shipped', '0987654320', 100.00, 4),
(5, '2023-07-05', 'pending', '0123456787', 300.00, 5),
(6, '2023-07-06', 'shipped', '0987654319', 350.00, 6),
(7, '2023-07-07', 'pending', '0123456786', 400.00, 7),
(8, '2023-07-08', 'shipped', '0987654318', 450.00, 8),
(9, '2023-07-09', 'pending', '0123456785', 500.00, 9),
(10, '2023-07-10', 'shipped', '0987654317', 550.00, 10),
(11, '2023-07-11', 'pending', '0123456784', 600.00, 11),
(12, '2023-07-12', 'shipped', '0987654316', 650.00, 12),
(13, '2023-07-13', 'pending', '0123456783', 700.00, 13),
(14, '2023-07-14', 'shipped', '0987654315', 750.00, 14),
(15, '2023-07-15', 'pending', '0123456782', 800.00, 15),
(16, '2023-07-16', 'shipped', '0987654314', 850.00, 16),
(17, '2023-07-17', 'pending', '0123456781', 900.00, 17),
(18, '2023-07-18', 'shipped', '0987654313', 950.00, 18),
(19, '2023-07-19', 'pending', '0123456780', 1000.00, 19),
(20, '2023-07-20', 'shipped', '0987654312', 1050.00, 20);
go
-- Data for OrderDetail table
INSERT INTO OrderDetail (variantId, orderId, quantity, price, discount) VALUES
(1, 1, 2, 75.00, 0),
(2, 2, 1, 200.00, 10),
(3, 3, 3, 83.33, 0),
(4, 4, 1, 100.00, 5),
(5, 5, 4, 75.00, 0),
(6, 6, 2, 175.00, 15),
(7, 7, 5, 80.00, 0),
(8, 8, 6, 75.00, 20),
(9, 9, 3, 166.67, 0),
(10, 10, 2, 275.00, 0),
(11, 11, 4, 150.00, 0),
(12, 12, 5, 130.00, 0),
(13, 13, 1, 700.00, 30),
(14, 14, 3, 250.00, 20),
(15, 15, 2, 400.00, 50),
(16, 16, 1, 850.00, 0),
(17, 17, 6, 150.00, 60),
(18, 18, 5, 190.00, 0),
(19, 19, 3, 333.33, 0),
(20, 20, 2, 525.00, 50),
(21, 1, 1, 75.00, 0),
(22, 2, 1, 200.00, 5),
(23, 3, 2, 125.00, 0),
(24, 4, 1, 100.00, 10),
(25, 5, 3, 100.00, 0),
(26, 6, 2, 175.00, 15),
(27, 7, 1, 400.00, 0),
(28, 8, 2, 225.00, 10),
(29, 9, 1, 500.00, 0),
(30, 10, 3, 183.33, 0);

--insert admin data
INSERT INTO Admin (adminId, username, [password], email)
VALUES (1, 'admin', 'admin', 'admin@example.com');

INSERT INTO Address (userId, street, [state], city) VALUES
(1, N'Số 123, Đường Láng', N'Hà Nội', N'Đống Đa'),
(2, N'Số 456, Đường Nguyễn Trãi', N'Hà Nội', N'Thanh Xuân'),
(3, N'Số 789, Đường Trần Duy Hưng', N'Hà Nội', N'Cầu Giấy'),
(4, N'Số 321, Đường Lý Thường Kiệt', N'TP Hồ Chí Minh', N'Quận 10'),
(5, N'Số 654, Đường Cách Mạng Tháng 8', N'TP Hồ Chí Minh', N'Quận 3'),
(6, N'Số 987, Đường Phạm Văn Đồng', N'TP Hồ Chí Minh', N'Bình Thạnh'),
(7, N'Số 147, Đường Xô Viết Nghệ Tĩnh', N'Đà Nẵng', N'Sơn Trà'),
(8, N'Số 258, Đường Hải Phòng', N'Đà Nẵng', N'Hải Châu'),
(9, N'Số 369, Đường Nguyễn Văn Linh', N'Đà Nẵng', N'Thanh Khê'),
(10, N'Số 741, Đường Lê Lợi', N'Huế', N'Thành phố Huế'),
(11, N'Số 852, Đường Trần Hưng Đạo', N'Huế', N'Thành phố Huế'),
(12, N'Số 963, Đường Phan Chu Trinh', N'Huế', N'Thành phố Huế'),
(13, N'Số 159, Đường Trường Chinh', N'Hải Phòng', N'Ngô Quyền'),
(14, N'Số 258, Đường Lạch Tray', N'Hải Phòng', N'Lê Chân'),
(15, N'Số 357, Đường Hoàng Diệu', N'Hải Phòng', N'Hồng Bàng'),
(16, N'Số 456, Đường Lê Hồng Phong', N'Quảng Ninh', N'Hạ Long'),
(17, N'Số 789, Đường Nguyễn Văn Cừ', N'Quảng Ninh', N'Uông Bí'),
(18, N'Số 147, Đường Bà Triệu', N'Quảng Ninh', N'Cẩm Phả'),
(19, N'Số 258, Đường Hùng Vương', N'Nha Trang', N'Phước Long'),
(20, N'Số 369, Đường 2 Tháng 4', N'Nha Trang', N'Vĩnh Hải'),
(21, N'Số 369, Đường 2 Tháng 4', N'Nha Trang', N'Vĩnh Hải');

-- Add the new column
ALTER TABLE Product
ADD status VARCHAR(10);
GO
-- Update the new column with the default value
UPDATE Product
SET status = 'enable';
GO
ALTER TABLE Product
ALTER COLUMN [description] nvarchar(100); -- Adjust length as necessary

-- Oppo
UPDATE Product
SET [description] = 'Oppo A17K is a stylish smartphone with advanced features.'
WHERE productId = 1;

UPDATE Product
SET [description] = 'Oppo A77s offers powerful performance and a sleek design.'
WHERE productId = 2;

UPDATE Product
SET [description] = 'Oppo A78 combines elegant design with high-end specifications.'
WHERE productId = 3;

UPDATE Product
SET [description] = 'Oppo Find n3 flip features a unique flip design and premium build.'
WHERE productId = 4;

UPDATE Product
SET [description] = 'Oppo Find X5 Pro excels in photography and performance.'
WHERE productId = 5;

UPDATE Product
SET [description] = 'Oppo Reno 8 delivers smooth performance and a stunning display.'
WHERE productId = 6;

UPDATE Product
SET [description] = 'Oppo Reno 10 offers flagship features at an affordable price.'
WHERE productId = 7;

-- Samsung
UPDATE Product
SET [description] = 'Samsung Galaxy S23 is designed for power users with cutting-edge technology.'
WHERE productId = 8;

UPDATE Product
SET [description] = 'Samsung Galaxy S23 Ultra pushes boundaries with its advanced camera system.'
WHERE productId = 9;

UPDATE Product
SET [description] = 'Samsung Galaxy S24 combines elegance with powerful performance.'
WHERE productId = 10;

UPDATE Product
SET [description] = 'Samsung Galaxy Tab A9+ plus is perfect for multimedia and productivity.'
WHERE productId = 11;

UPDATE Product
SET [description] = 'Samsung Galaxy Tab S6 Lite offers a premium tablet experience.'
WHERE productId = 12;

UPDATE Product
SET [description] = 'Samsung Galaxy Tab S9 FE+ is ideal for productivity and entertainment.'
WHERE productId = 13;

UPDATE Product
SET [description] = 'Samsung Galaxy Z Flip 3 is a foldable phone that fits your pocket.'
WHERE productId = 14;

UPDATE Product
SET [description] = 'Samsung Galaxy Z Flip 4 combines style with the latest technology.'
WHERE productId = 15;

UPDATE Product
SET [description] = 'Samsung Galaxy Z Fold 4 is a versatile foldable phone for power users.'
WHERE productId = 16;

-- Apple
UPDATE Product
SET [description] = 'Apple iPad 11 inch offers a stunning display and powerful performance.'
WHERE productId = 17;

UPDATE Product
SET [description] = 'Apple iPad Air 6 M2 features advanced performance and sleek design.'
WHERE productId = 18;

UPDATE Product
SET [description] = 'Apple iPad Air M2 delivers exceptional performance and portability.'
WHERE productId = 19;

UPDATE Product
SET [description] = 'Apple iPad Gen 10 is perfect for everyday use with its compact design.'
WHERE productId = 20;

-- Lenovo
UPDATE Product
SET [description] = 'Lenovo Tab P11 gen 2 offers a premium tablet experience with enhanced features.'
WHERE productId = 31;

UPDATE Product
SET [description] = 'Lenovo Tab P12 is designed for productivity and entertainment on the go.'
WHERE productId = 32;

UPDATE Product
SET [description] = 'Lenovo Ideapad combines performance with affordability.'
WHERE productId = 33;

UPDATE Product
SET [description] = 'Lenovo Legion Pro is a gaming powerhouse with cutting-edge features.'
WHERE productId = 34;

UPDATE Product
SET [description] = 'Lenovo Thinkpad P16 Gen 2 offers professional-grade performance and durability.'
WHERE productId = 35;

UPDATE Product
SET [description] = 'Lenovo Thinkpad X1 Carbon is the ultimate business laptop.'
WHERE productId = 36;

UPDATE Product
SET [description] = 'Lenovo Yoga C94 combines flexibility with powerful performance.'
WHERE productId = 37;

-- Huawei
UPDATE Product
SET [description] = 'Huawei Matepad offers seamless multitasking and entertainment.'
WHERE productId = 38;

-- Google
UPDATE Product
SET [description] = 'Google Pixel 4 XL delivers exceptional camera performance and smooth experience.'
WHERE productId = 39;

-- Xiaomi
UPDATE Product
SET [description] = 'Xiaomi Redmi Note 10 combines affordability with impressive features.'
WHERE productId = 40;

UPDATE Product
SET [description] = 'Xiaomi Redmi Note 10S offers powerful performance and stunning design.'
WHERE productId = 41;

UPDATE Product
SET [description] = 'Xiaomi Redmi Note 11 features advanced technology in an affordable package.'
WHERE productId = 42;

-- Vivo
UPDATE Product
SET [description] = 'Vivo Y16 is designed for budget-conscious consumers looking for great performance.'
WHERE productId = 43;

-- Acer
UPDATE Product
SET [description] = 'Acer Aspire 5 is a versatile laptop for everyday computing.'
WHERE productId = 44;

UPDATE Product
SET [description] = 'Acer Chromebook Spin 713 offers flexibility and performance in a stylish design.'
WHERE productId = 45;

UPDATE Product
SET [description] = 'Acer Concept TD 7 is designed for creative professionals with high-end features.'
WHERE productId = 46;

UPDATE Product
SET [description] = 'Acer Notebook Nitro V15 delivers powerful gaming performance.'
WHERE productId = 47;

UPDATE Product
SET [description] = 'Acer Predator Helios 300 is a gaming laptop with top-tier performance.'
WHERE productId = 48;

UPDATE Product
SET [description] = 'Acer Swift 14 offers portability and performance for productivity on the go.'
WHERE productId = 49;

-- Dell
UPDATE Product
SET [description] = 'Dell Alienware M17 offers extreme gaming performance in a stylish chassis.'
WHERE productId = 50;

UPDATE Product
SET [description] = 'Dell Inspiron 15700 is designed for everyday computing with powerful features.'
WHERE productId = 51;

UPDATE Product
SET [description] = 'Dell Notebook Latitude 7640 is a business laptop with exceptional reliability.'
WHERE productId = 52;

UPDATE Product
SET [description] = 'Dell XPS 139315 delivers a premium experience with its sleek design and powerful performance.'
WHERE productId = 53;

UPDATE Product
SET [description] = 'Dell XPS 59500 combines performance with elegance in a compact form factor.'
WHERE productId = 54;

-- HP
UPDATE Product
SET [description] = 'HP Elitebook645 offers security and durability for business professionals.'
WHERE productId = 55;

UPDATE Product
SET [description] = 'HP Envy 17 delivers stunning visuals and powerful performance for creative professionals.'
WHERE productId = 56;

UPDATE Product
SET [description] = 'HP Pavilion Aero 13 is designed for portability and productivity.'
WHERE productId = 57;

UPDATE Product
SET [description] = 'HP Spectre X36 offers premium design and performance for discerning users.'
WHERE productId = 58;

-- Asus
UPDATE Product
SET [description] = 'Asus Proat Studiobook Pro 16 is a powerhouse for creative professionals.'
WHERE productId = 60;
