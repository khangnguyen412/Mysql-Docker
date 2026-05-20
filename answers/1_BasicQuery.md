## PHẦN 1: TRUY VẤN CƠ BẢN
1. **Liệt kê nhân viên:** Lấy `first_name`, `last_name` và `title` của tất cả nhân viên có tiêu đề là 'Teller'. Sắp xếp theo `last_name` bảng chữ cái.
```sql
SELECT first_name, last_name, title 
FROM employee 
WHERE title = 'Teller' 
ORDER BY last_name ASC;
```
2. **Khách hàng ở thành phố lớn:** Tìm tất cả khách hàng (`customer`) có `city` là 'Salem' hoặc 'Waltham'.
```sql
SELECT * 
FROM customer 
WHERE city IN ('Salem', 'Waltham');
```
3. **Tài khoản đang hoạt động:** Liệt kê `account_id`, `avail_balance` của các tài khoản có `status` là 'ACTIVE' và có số dư khả dụng (`avail_balance`) trên 2000.
```sql
SELECT account_id, avail_balance 
FROM account 
WHERE status = 'ACTIVE' AND avail_balance > 2000;
```
4. **Mở rộng:** từ đó suy ra thứ tự thực thi (Logical Query Processing) đúng của các mệnh đề trong câu lệnh SELECT … FROM … WHERE… trên là gì
    - **`FROM` chạy đầu tiên:** Hệ thống xác định bảng dữ liệu cần truy xuất là `employee`.
    - **`WHERE` chạy thứ hai:** Hệ thống lọc ra các dòng có `title = "Teller"`. Việc lọc này diễn ra trước khi chọn cột để tiết kiệm tài nguyên.
    - **`SELECT` chạy cuối cùng:** Sau khi đã có các dòng thỏa mãn điều kiện, hệ thống mới bắt đầu lấy ra 3 cột cụ thể là `first_name`, `last_name`, và `title` để hiển thị kết quả.
5. **Liệt kê các sản phẩm (`product`) còn đang được cung cấp** (chưa có `date_retired`). Hiển thị `product_cd`, `name`, `date_offered`.
```sql
SELECT product_cd, name, date_offered
FROM product
WHERE date_retired IS NULL;
```
6. **Tìm các giao dịch (`acc_transaction`) có số tiền `amount` nằm trong khoảng từ 100 đến 1000** (không bao gồm biên 1000). Sắp xếp theo `amount` giảm dần.
```sql
SELECT *
FROM acc_transaction
WHERE amount >= 100 AND amount < 1000
ORDER BY amount DESC;
```
7. **Lấy danh sách nhân viên có `title` bắt đầu bằng chữ 'H'** (ví dụ: 'Head Teller'). Hiển thị `first_name`, `last_name`, `title`.
```sql
SELECT first_name, last_name, title
FROM employee
WHERE title LIKE 'H%';
```
8. **Tìm các tài khoản (`account`) được mở vào năm 2004** (sử dụng `open_date`). Hiển thị `account_id`, `product_cd`, `open_date`.
```sql
SELECT account_id, product_cd, open_date
FROM account
WHERE YEAR(open_date) = 2004;
```
9. **Đếm số lượng khách hàng (`customer`) có `postal_code` bắt đầu bằng '02'** (khu vực Massachusetts?).
```sql
SELECT COUNT(*) AS total_customers
FROM customer
WHERE postal_code LIKE '02%';
```