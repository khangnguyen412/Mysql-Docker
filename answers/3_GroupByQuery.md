## PHẦN 3: TỔNG HỢP DỮ LIỆU (GROUP BY, HAVING)
1. **Thống kê số dư theo chi nhánh:** Tính tổng số dư khả dụng (`avail_balance`) của tất cả tài khoản theo từng chi nhánh (`open_branch_id`).
```sql
SELECT open_branch_id, SUM(avail_balance) AS total_balance
FROM account
GROUP BY open_branch_id;
```
2. **Tìm khách hàng VIP:** Liệt kê các khách hàng (`cust_id`) có tổng số dư trong tất cả các tài khoản của họ lớn hơn 5000.
```sql
SELECT cust_id, SUM(avail_balance) AS total_customer_balance
FROM account
GROUP BY cust_id
HAVING SUM(avail_balance) > 5000;
```
3. **Đếm giao dịch:** Tìm những tài khoản (`account_id`) có nhiều hơn 5 giao dịch được thực hiện trong năm 2025.
```sql
SELECT account_id, COUNT(txn_id) AS total_transactions
FROM acc_transaction
WHERE YEAR(txn_date) = 2025
GROUP BY account_id
HAVING COUNT(txn_id) > 5;
```
4. Tính số lượng nhân viên trong từng phòng ban (department_id) và chỉ hiển thị các phòng ban có trên 5 nhân viên.
```sql
select dept_id, count(*) from employee e GROUP BY dept_id HAVING count(*) > 5;
```
5. **Tính tổng số dư khả dụng (`avail_balance`) trung bình cho mỗi loại sản phẩm (`product_cd`)**. Chỉ hiển thị các loại sản phẩm có số dư trung bình > 2000.
```sql
SELECT product_cd, AVG(avail_balance) AS avg_balance
FROM account
GROUP BY product_cd
HAVING AVG(avail_balance) > 2000;
```
6. **Đếm số lượng tài khoản (`account`) được mở bởi từng nhân viên (`open_emp_id`)**. Sắp xếp theo số lượng giảm dần, chỉ lấy top 5 nhân viên mở nhiều tài khoản nhất.
```sql
SELECT open_emp_id, COUNT(*) AS so_tai_khoan
FROM account
GROUP BY open_emp_id
ORDER BY so_tai_khoan DESC
LIMIT 5;
```
7. **Tìm tổng số tiền giao dịch (`amount`) theo từng loại giao dịch (`txn_type_cd`)**. Kết quả gồm: `txn_type_cd`, `total_amount`.
```sql
SELECT txn_type_cd, SUM(amount) AS total_amount
FROM acc_transaction
GROUP BY txn_type_cd;
```
8. **Với mỗi chi nhánh (`branch`), tính số lượng nhân viên đang làm việc** (dựa vào `assigned_branch_id` trong `employee`). Hiển thị tên chi nhánh và số lượng.
```sql
SELECT b.name AS branch_name, COUNT(e.emp_id) AS so_nhan_vien
FROM branch b
LEFT JOIN employee e ON b.branch_id = e.assigned_branch_id
GROUP BY b.branch_id;
```
9. **Tìm tháng (năm + tháng) có nhiều giao dịch nhất** (chỉ cần số lượng giao dịch). Hiển thị tháng (dạng 'YYYY-MM') và tổng số giao dịch.
```sql
SELECT DATE_FORMAT(txn_date, '%Y-%m') AS thang, COUNT(*) AS so_gd
FROM acc_transaction
GROUP BY thang
ORDER BY so_gd DESC
LIMIT 1;
```
