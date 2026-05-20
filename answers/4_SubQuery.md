## PHẦN 4: NÂNG CAO (SUBQUERY & LOGIC)
1. **Nhân viên chưa bao giờ mở tài khoản:** Tìm `emp_id`, `first_name` của những nhân viên chưa từng thực hiện mở bất kỳ tài khoản nào (không xuất hiện trong cột `open_emp_id` của bảng `account`).
```sql
SELECT emp_id, first_name, last_name
FROM employee
WHERE emp_id NOT IN (SELECT DISTINCT open_emp_id FROM account);
```
2. Tìm tất cả nhân viên làm việc trong cùng phòng ban với nhân viên có firstname là "sarah".
```sql
select * from employee e WHERE e.dept_id = (select dept_id FROM employee e2  WHERE first_name like "sarah");
```
3. Tìm tất cả giao dịch có số tiền (amount) lớn hơn mức trung bình của tất cả các giao dịch.
```sql
select * from acc_transaction at2 WHERE at2.amount > (select AVG(amount) FROM acc_transaction at3);
```
4. **Tìm các nhân viên chưa từng được phân công làm `teller_emp_id` trong bất kỳ giao dịch nào** (không xuất hiện trong `acc_transaction.teller_emp_id`).
```sql
SELECT emp_id, first_name, last_name
FROM employee
WHERE emp_id NOT IN (SELECT DISTINCT teller_emp_id FROM acc_transaction WHERE teller_emp_id IS NOT NULL);
```
5. **Liệt kê các khách hàng (`cust_id`) có ít nhất 2 tài khoản** (đếm số lượng tài khoản trong bảng `account`).
```sql
SELECT cust_id
FROM account
GROUP BY cust_id
HAVING COUNT(*) >= 2;
```
6. **Tìm sản phẩm (`product_cd`) chưa từng được bất kỳ tài khoản nào sử dụng** (không xuất hiện trong `account.product_cd`).
```sql
SELECT product_cd, name
FROM product
WHERE product_cd NOT IN (SELECT DISTINCT product_cd FROM account);
```
7. **Lấy danh sách các chi nhánh (`branch`) có tổng số dư khả dụng của tài khoản lớn hơn 10,000** (sử dụng subquery trong `HAVING` hoặc `WHERE` với `SUM`).
```sql
SELECT b.branch_id, b.name, SUM(a.avail_balance) AS total_balance
FROM branch b
JOIN account a ON b.branch_id = a.open_branch_id
GROUP BY b.branch_id
HAVING total_balance > 10000;
```
8. **Tìm nhân viên có mức lương (không có sẵn, nhưng có thể giả sử) – thay vào đó: Tìm nhân viên có số lượng tài khoản do họ mở nhiều hơn bất kỳ nhân viên nào có `title = 'Teller'`.** (Sử dụng `ALL` hoặc `MAX` subquery).
```sql
SELECT emp_id, first_name, last_name, COUNT(*) AS so_tk
FROM employee e
JOIN account a ON e.emp_id = a.open_emp_id
GROUP BY e.emp_id
HAVING so_tk > ALL (SELECT COUNT(*) FROM account a2 JOIN employee e2 ON a2.open_emp_id = e2.emp_id WHERE e2.title = 'Teller' GROUP BY e2.emp_id);
```

