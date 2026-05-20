## PHẦN 5: TRUY VẤN NÂNG CAO (ADVANCED SQL)
1.  **Quản lý và nhân viên (Self-JOIN)** Hiển thị danh sách nhân viên gồm: `Tên nhân viên`, `Chức danh` và `Tên người quản lý trực tiếp` của họ (dựa trên cột `superior_emp_id`). Nếu nhân viên không có quản lý (Sếp tổng), hãy hiển thị là 'No Manager'.
```sql
SELECT 
    e.first_name AS employee_name, 
    e.title,
    IFNULL(m.first_name, 'No Manager') AS manager_name
FROM employee e
LEFT JOIN employee m ON e.superior_emp_id = m.emp_id;
```
2.  **Thống kê khách hàng theo loại (Business vs Individual)** Đếm xem có bao nhiêu khách hàng là doanh nghiệp (`business`) và bao nhiêu khách hàng là cá nhân (`individual`). Kết quả trả về gồm 2 cột: `Loại khách hàng` và `Số lượng`.
```sql
SELECT 'Business' AS customer_type, COUNT(*) AS total FROM business
UNION
SELECT 'Individual' AS customer_type, COUNT(*) AS total FROM individual;
```
3.  **Truy vấn con tương quan (Correlated Subquery)** Tìm tất cả các tài khoản (`account`) có số dư khả dụng (`avail_balance`) lớn hơn số dư trung bình của tất cả các tài khoản cùng loại sản phẩm (`product_cd`) đó.
```sql
SELECT a1.account_id, a1.product_cd, a1.avail_balance
FROM account a1
WHERE a1.avail_balance > (
    SELECT AVG(a2.avail_balance)
    FROM account a2
    WHERE a2.product_cd = a1.product_cd
);
```
4.  **Tìm chi nhánh "bận rộn" nhất** Tìm tên chi nhánh (`branch.name`) đã thực hiện nhiều giao dịch nhất (`acc_transaction`) trong lịch sử.
```sql
SELECT b.name AS branch_name, COUNT(*) AS total_transactions
FROM acc_transaction t
JOIN branch b ON t.open_branch_id = b.branch_id
GROUP BY b.name
ORDER BY total_transactions DESC
LIMIT 1;
```
5.  **Phân tích dòng tiền theo ngày** Với mỗi ngày có giao dịch, hãy tính tổng số tiền gửi (giả sử `txn_type_cd = 'CDT'`) và tổng số tiền rút (giả sử `txn_type_cd = 'DBT'`). Kết quả gồm: `Ngày`, `Tổng gửi`, `Tổng rút`.
```sql
SELECT 
    DATE(txn_date) AS date,
    SUM(CASE WHEN txn_type_cd = 'CDT' THEN amount ELSE 0 END) AS total_credit,
    SUM(CASE WHEN txn_type_cd = 'DBT' THEN amount ELSE 0 END) AS total_debit
FROM acc_transaction
GROUP BY DATE(txn_date);
```
6. Lấy danh sách cust_id của cả khách hàng cá nhân và doanh nghiệp (từ customer và business).
```sql
select cust_id, fed_id  from customer c UNION SELECT cust_id, state_id  FROM  business b 
```
7. **Tính số ngày giữa ngày mở tài khoản (`open_date`) và ngày hoạt động gần nhất (`last_activity_date`)** cho mỗi tài khoản. Hiển thị `account_id`, `open_date`, `last_activity_date`, và số ngày chênh lệch.
```sql
SELECT account_id, open_date, last_activity_date, DATEDIFF(last_activity_date, open_date) AS so_ngay
FROM account;
```
8. **Lấy các giao dịch được thực hiện trong tháng 12 năm 2004** (bất kỳ ngày nào). Hiển thị `txn_id`, `txn_date`, `amount`.
```sql
SELECT txn_id, txn_date, amount
FROM acc_transaction
WHERE YEAR(txn_date) = 2004 AND MONTH(txn_date) = 12;
```
9. **Hiển thị tên đầy đủ của khách hàng cá nhân (`individual`) ở dạng "Họ, Tên"** (ví dụ: 'Hadley, James'). Sắp xếp theo họ.
```sql
SELECT CONCAT(last_name, ', ', first_name) AS ho_ten
FROM individual
ORDER BY last_name;
```
10. **Tìm các nhân viên có tên (`first_name`) chứa ký tự 'e' và độ dài tên ít nhất 5 ký tự.**
```sql
SELECT first_name, last_name
FROM employee
WHERE first_name LIKE '%e%' AND LENGTH(first_name) >= 5;
```
11. **Trích xuất năm từ `open_date` của tài khoản và đếm số lượng tài khoản được mở theo từng năm.** Kết quả: `nam`, `so_luong`.
```sql
SELECT YEAR(open_date) AS nam, COUNT(*) AS so_luong
FROM account
GROUP BY nam;
```
