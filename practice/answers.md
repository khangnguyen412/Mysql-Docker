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
