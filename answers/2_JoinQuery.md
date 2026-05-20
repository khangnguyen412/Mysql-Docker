## PHẦN 2: TRUY VẤN CÓ KẾT NỐI (JOIN)
1. **Chi tiết tài khoản:** Hiển thị `account_id`, `avail_balance` cùng với `first_name` và `last_name` của khách hàng cá nhân (`individual`) sở hữu tài khoản đó.
```sql
SELECT a.account_id, a.avail_balance, i.first_name, i.last_name
FROM account a
JOIN individual i ON a.cust_id = i.cust_id;
```
2. **Chi nhánh và nhân viên:** Liệt kê tên chi nhánh (`branch.name`) và tên đầy đủ của các nhân viên làm việc tại chi nhánh đó.
```sql
SELECT b.name AS branch_name, e.first_name, e.last_name
FROM branch b
JOIN employee e ON b.branch_id = e.assigned_branch_id;
```
3. **Giao dịch của tài khoản:** Hiển thị 10 giao dịch gần đây nhất (`acc_transaction`), bao gồm: `txn_id`, `txn_date`, `amount` và tên loại sản phẩm (`product.name`) của tài khoản thực hiện giao dịch đó.
```sql
SELECT t.txn_id, t.txn_date, t.amount, p.name AS product_name
FROM acc_transaction t
JOIN account a ON t.account_id = a.account_id
JOIN product p ON a.product_cd = p.product_cd
ORDER BY t.txn_date DESC
LIMIT 10;
```
4. Giả sử bạn có 2 bảng employees và departments. Hãy viết câu SQL để lấy danh sách tất cả nhân viên, cùng với tên phòng ban của họ, kể cả nhân viên chưa được phân phòng.
```sql
select * from employee e LEFT JOIN department d  ON e.dept_id  = d.dept_id
```
5. **Hiển thị thông tin chi tiết của giao dịch:** `txn_id`, `txn_date`, `amount`, tên nhân viên giao dịch (`employee.first_name`, `employee.last_name`) và tên chi nhánh thực hiện giao dịch (`branch.name`).
```sql
SELECT t.txn_id, t.txn_date, t.amount, e.first_name, e.last_name, b.name AS branch_name
FROM acc_transaction t
JOIN employee e ON t.account_id = e.account_id
JOIN branch b ON e.assigned_branch_id = b.branch_id
```
6. **Liệt kê tất cả các khách hàng (`customer`) cùng với thông tin cá nhân nếu có** (từ bảng `individual`) **hoặc thông tin doanh nghiệp nếu có** (từ bảng `business`). Gợi ý: sử dụng `LEFT JOIN` với cả hai bảng.
```sql
SELECT c.cust_id, i.first_name, i.last_name, b.name AS business_name
FROM customer c
LEFT JOIN individual i ON c.cust_id = i.cust_id
LEFT JOIN business b ON c.cust_id = b.cust_id
```
7. **Tìm tất cả nhân viên và cấp trên của họ** (self-join trên `employee`), hiển thị `(emp_first, emp_last, superior_first, superior_last)`. Nếu không có cấp trên thì hiển thị `NULL`.
```sql
SELECT e.first_name AS emp_first, e.last_name AS emp_last, s.first_name AS superior_first, s.last_name AS superior_last
FROM employee e
LEFT JOIN employee s ON e.supervisor_id = s.employee_id
```
8. **Hiển thị danh sách tài khoản (`account`) cùng với tên sản phẩm (`product.name`) và tên khách hàng** (lấy từ `customer` bảng, không phân biệt loại khách hàng). Không cần thông tin chi tiết cá nhân/doanh nghiệp.
```sql
SELECT a.account_id, p.name AS product_name, c.cust_id    
FROM account a
JOIN product p ON a.product_cd = p.product_cd
JOIN customer c ON a.cust_id = c.cust_id
```
9. **Tìm các giao dịch được thực hiện bởi nhân viên có `title` là 'Teller'** và số tiền giao dịch > 200. Hiển thị `txn_id`, `amount`, tên nhân viên.
```sql
SELECT at.txn_id, at.amount, e.first_name, e.last_name
FROM acc_transaction at
JOIN employee e ON at.teller_emp_id = e.emp_id
WHERE e.title = 'Teller' AND at.amount > 200;
```
