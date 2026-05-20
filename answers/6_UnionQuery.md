## PHẦN 6: CÁC TRUY VẤN SỬ DỤNG UNION, INTERSECT, EXCEPT (hoặc NOT IN)
1. **Kết hợp danh sách `cust_id` của khách hàng cá nhân (`individual`) và khách hàng doanh nghiệp (`business`)**. Loại bỏ trùng lặp.
```sql
SELECT cust_id FROM individual
UNION
SELECT cust_id FROM business;
```
2. **Tìm các `cust_id` có trong bảng `customer` nhưng không có trong bảng `individual` cũng không trong `business`** (thực tế không thể xảy ra theo ràng buộc, nhưng hãy giả sử nếu có – để rèn luyện `NOT EXISTS`).
```sql
SELECT cust_id FROM customer
WHERE cust_id NOT IN (SELECT cust_id FROM individual)
  AND cust_id NOT IN (SELECT cust_id FROM business);
-- Thực tế không có, nhưng cú pháp đúng
```
3. **Hiển thị danh sách tất cả `first_name` của nhân viên (`employee`) và tất cả `first_name` của khách hàng cá nhân (`individual`)**. Gộp chung và sắp xếp.
```sql
SELECT first_name FROM employee
UNION
SELECT first_name FROM individual
ORDER BY first_name;
```
4. **Lấy danh sách `product_cd` vừa thuộc loại tài khoản ('account') vừa có ngày nghỉ hưu (`date_retired`) là `NULL`.** (Kết hợp điều kiện từ `product` và `product_type`).
```sql
SELECT p.product_cd
FROM product p
JOIN product_type pt ON p.product_type_cd = pt.product_type_cd
WHERE pt.name = 'customer accounts' AND p.date_retired IS NULL;
```
